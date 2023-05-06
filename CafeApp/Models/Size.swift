//
//  Size.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation
import RealmSwift

class Size: Object, ObjectKeyIdentifiable, Codable {

  @Persisted(primaryKey: true) var id: String
  @Persisted var name: String
  @Persisted var v: Int?
  
  override class func primaryKey() -> String? {
      "id"
  }
  
  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name
      case v = "__v"
  }
  
  required convenience init(from decoder: Decoder) throws {
       self.init()
       let container = try decoder.container(keyedBy: CodingKeys.self)
       id = try container.decode(String.self, forKey: .id)
       name = try container.decode(String.self, forKey: .name)
       v = try? container.decode(Int?.self, forKey: .v)
   }

}

