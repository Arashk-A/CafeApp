//
//  Coffie.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

// MARK: - Welcome
struct Coffee: Codable, Hashable, Identifiable {
    let id: String
    let types: [CoffeeType]
    let sizes: [Size]
    let extras: [Extra]

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case types, sizes, extras
    }
}

extension Coffee {
  
  var coffeeTypes: [CoffeeType] {
    return types
  }
  
  func getSizes(for coffee: CoffeeType) -> [Size] {
    var avSizes: [Size] = []
    
    for size in coffee.sizes {
      
      avSizes.append(contentsOf: sizes.filter { $0.id == size })
    }
    
    return avSizes
  }
  
  func getExtras(for coffee: CoffeeType) -> [Extra] {
    var avExtra: [Extra] = []
    
    for extra in coffee.extras {
      avExtra.append(contentsOf: extras.filter { $0.id == extra })
    }
    
    return avExtra
  }
  
}



