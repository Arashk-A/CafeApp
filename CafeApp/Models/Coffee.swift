//
//  Coffie.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation
import RealmSwift

class Coffee: Object, ObjectKeyIdentifiable, Codable {
  
  @Persisted(primaryKey: true) var id: String
  
  @Persisted var types: List<CoffeeType>
  @Persisted var sizes: List<Size>
  @Persisted var extras: List<Extra>
      
  override class func primaryKey() -> String? {
      "id"
  }
  
  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case types, sizes, extras
  }
  
  required convenience init(from decoder: Decoder) throws {
    self.init()
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(String.self, forKey: .id)

    let typesList = try container.decode(List<CoffeeType>.self, forKey: .types)
    types = typesList
    let sizeList = try container.decode(List<Size>.self, forKey: .sizes)
    sizes = sizeList
    let extrasList = try container.decode(List<Extra>.self, forKey: .extras)
    extras = extrasList
  }
}


extension Coffee {
  
  var coffeeTypes: [CoffeeType] {
    var types: [CoffeeType] = []
    types.append(contentsOf: self.types)
    return types
  }
  
  func getExtras(for coffee: CoffeeType) -> [Extra] {
    var avExtra: [Extra] = []
    
    for extra in coffee.extras {
      avExtra.append(contentsOf: extras.filter { $0.id == extra })
    }
    
    return avExtra
  }
  
}



