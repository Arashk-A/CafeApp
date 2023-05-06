//
//  CoffeeType.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

// MARK: - CoffieType
struct CoffeeType: Codable, Identifiable, Hashable {
  let id: String
  let name: String
  let sizes: [String]
  let extras: [String]

  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name, sizes, extras
  }
  
  static var dummyType: CoffeeType {
    let sizes = ["60ba18d13ca8c43196b5f606","60ba3368c45ecee5d77a016b"]
    return CoffeeType(id: "60ba1a062e35f2d9c786c56d", name: "Ristretto", sizes: sizes, extras: ["60ba197c2e35f2d9c786c525"])
      
  }
}
