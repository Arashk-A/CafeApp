//
//  CoffeeSizeViewModel.swift
//  CafeApp
//
//  Created by zero on 5/5/23.
//

import Foundation
import RealmSwift

@MainActor
class CoffeeSizeViewModel: ObservableObject {
  private let sizeFetcher: CoffeeSizeFetcher
  private let realmManager = RealmManager()
  
  @Published var error: Bool = false
  @Published var isLoading: Bool = false
  @Published var errorMessage: String = ""
  @Published var availableSizes: [Size] = []
  
  var selectedType: CoffeeType?
  var coffeeSizes: [Size] = []
  
  
  init(isLoading: Bool = false, sizeFetcher: CoffeeSizeFetcher) {
    self.isLoading = isLoading
    self.sizeFetcher = sizeFetcher
  }
  
  func getSizes(coffee: CoffeeType) async {
    self.selectedType = coffee
    
    if coffeeSizes.isEmpty {
      if !loadFromDB() {
        await makeApiCall()
      }
      
      for size in coffee.sizes {
        availableSizes.append(contentsOf: coffeeSizes.filter { $0.id == size })
      }
    }
    
  }
  
  func loadFromDB() -> Bool {
    if let realm = realmManager.realm {
      let sizes = realm.objects(Size.self)
      
      if !sizes.isEmpty, coffeeSizes.isEmpty {
        
        coffeeSizes.append(contentsOf: sizes)
        return true
      }
    }
    return false
  }
  
  func makeApiCall() async {
      isLoading = true
      
      do {
        let result = try await sizeFetcher.fetchCoffeeSizes()
        
        if !result.isEmpty {
          saveToDB(data: result)
          
          _ = loadFromDB()
          
        } else {
          getFromFile()
        }
      } catch let err {
        if coffeeSizes.isEmpty {
          getFromFile()
        }
        
        print("Error... \(err.localizedDescription)")
        error = true
        errorMessage = "Request Failed: Please try again"
        
      }
      
      isLoading = false
  }
  
  func getFromFile() {
    if let realm = realmManager.realm {
      let coffees = realm.objects(Coffee.self)
      
      if !coffees.isEmpty, let coff = coffees.first {
        
        coffeeSizes.append(contentsOf: coff.sizes)
      }
    }
  }
  

}

extension CoffeeSizeViewModel {
  func saveToDB(data: [Size]) {
    do {
      if let realm = realmManager.realm {
        try realm.write {
            realm.add(data)
        }
      }
    } catch {
      print("Error happened")
    }
  }
}


