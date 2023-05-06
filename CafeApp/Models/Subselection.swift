//
//  Subselection.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

// MARK: - Subselection
struct Subselection: Codable, Hashable, Identifiable {
  let id: String
  let name: String
  var isSelected: Bool? = nil

  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name, isSelected
  }
}
