//
//  Size.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

// MARK: - Size
struct Size: Codable, Identifiable, Hashable {
  let id: String
  let name: String
  let v: Int?

  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name
      case v = "__v"
  }
}
