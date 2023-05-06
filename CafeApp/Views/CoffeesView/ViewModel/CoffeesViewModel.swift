//
//  CoffeesViewModel.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation
import RealmSwift

@MainActor
class CoffeesViewModel: ObservableObject {
  private let coffeeFetcher: CoffeeFetcher
  private let realmManager = RealmManager()
  
  @Published var error: Bool = false
  @Published var isLoading: Bool = false
  @Published var errorMessage: String = ""
  @Published var coffeeTypes: [CoffeeType] = []
  @Published var seletedExtras: [Extra] = []
  @Published var selectedExtra: [String: String] = [:]
  
  
  var coffees: [Coffee] = []
  var selectedCoffee: CoffeeType?
  var selectedSize: Size?
  
  var selectedExtraSub: [String: String] = [:]
  
  init(isLoading: Bool = false, coffeeFetcher: CoffeeFetcher) {
    self.isLoading = isLoading
    self.coffeeFetcher = coffeeFetcher
  }
  
  func getExtras(_ size: Size) {
    selectedSize = size
    
    guard let coffee = selectedCoffee,
      let coffees = coffees.first else { return  }
    let extras = coffees.getExtras(for: coffee)
    seletedExtras = extras
  }
  
  func selectedExtra(_ extra: Extra, subId: String) {
    for ex in seletedExtras {
      if ex.id == extra.id {
        if let selectedSub = ex.subselections.filter({ $0.id == subId }).first {
          
          selectedExtraSub[ex.id] = selectedSub.id
          selectedExtra = selectedExtraSub
        }
      }
    }
  }
  
  
  func isLastSubselection(_ extra: Extra, subId: String) -> Bool {
    let count  = extra.subselections.count - 1
    return extra.subselections[count].id == subId
  }

}

// MARK: - API CALL
extension CoffeesViewModel {
  
  func getData() async {
    if !coffees.isEmpty {
      populateTypes(coffees)
      return
    }
    if coffeeTypes.isEmpty {
      if UserDefaults.isFirstTimePassed {
        _ = loadFromDB()
      } else {
        await getCoffees()
      }
      
    } else {
      coffeeTypes = coffeeTypes
    }
  }
  
  func loadFromDB() -> Bool {
    if let realm = realmManager.realm {
      let result = realm.objects(Coffee.self)
      print(result.count)
      if !result.isEmpty, coffees.isEmpty {
        coffees = result.map({$0})
        
        populateTypes(coffees)
        return true
      }
    }
    return false
  }
  
  func populateTypes(_ coffes: [Coffee]) {
    if let coffes = coffes.first, coffeeTypes.isEmpty  {
      coffeeTypes.append(contentsOf: coffes.types)
    }
  }

  func getCoffees() async {
    isLoading = true
    
    do {
      let result = try await coffeeFetcher.fetchCoffees()
      
      if !result.isEmpty {
        saveToDB(data: result)
        
         _ = loadFromDB()
        
      } else {
        await getFromFile()
      }
    } catch let err {
      if coffees.isEmpty {
        await getFromFile()
      }
      print("Error... \(err.localizedDescription)")
      error = true
      errorMessage = "Request Failed: Please try again"
      
    }
    
    isLoading = false
  }
  
  func getFromFile() async {
    if let items: [Coffee] = try? await CoffeeFetcherMock().fetchCoffees(),
       !items.isEmpty, let types = items.first?.types {
      coffees = items
      coffeeTypes.append(contentsOf: types)

      saveToDB(data: items)
    }
  }
  
  func saveToDB(data: [Coffee]) {
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
