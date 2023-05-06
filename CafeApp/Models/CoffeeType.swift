//
//  CoffeeType.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation
import RealmSwift


class CoffeeType: Object, ObjectKeyIdentifiable, Codable {
  @Persisted(primaryKey: true) var id: String
  @Persisted var name: String
  @Persisted var sizes: List<String>
  @Persisted var extras: List<String>
  
  override class func primaryKey() -> String? {
    "id"
  }
  
  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name, sizes, extras
  }
  
  required convenience init(from decoder: Decoder) throws {
    self.init()
    let container = try decoder.container(keyedBy: CodingKeys.self)

    id = try container.decode(String.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)

    let sizeList = try container.decode(List<String>.self, forKey: .sizes)
    sizes = sizeList
    let extrasList = try container.decode(List<String>.self, forKey: .extras)
    extras = extrasList
  }
  
}
