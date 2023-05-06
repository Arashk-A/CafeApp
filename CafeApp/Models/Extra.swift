//
//  Extra.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

import RealmSwift


// MARK: - Extra
class Extra: Object, ObjectKeyIdentifiable, Codable {
  @Persisted(primaryKey: true) var id: String
  @Persisted var name: String
  @Persisted var subselections: List<Subselection> = List<Subselection>()
  
  override class func primaryKey() -> String? {
      "id"
  }
  
  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name, subselections
  }
  
  required convenience init(from decoder: Decoder) throws {
       self.init()
       let container = try decoder.container(keyedBy: CodingKeys.self)
       id = try container.decode(String.self, forKey: .id)
       name = try container.decode(String.self, forKey: .name)
    
    let subselectionsList = try container.decode(List<Subselection>.self, forKey: .subselections)
    subselections = subselectionsList

   }
    var labelText: String {
      return name.contains("milk") ? "milk" : "sugar"
    }

}

