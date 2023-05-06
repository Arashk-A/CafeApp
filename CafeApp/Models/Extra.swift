//
//  Extra.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation


// MARK: - Extra
struct Extra: Codable, Identifiable, Hashable {
  let id: String
  let name: String
  var subselections: [Subselection]

  enum CodingKeys: String, CodingKey {
      case id = "_id"
      case name, subselections
  }
  
  mutating func selectedSubselection(to id: String) {
    var newSub = [Subselection]()
    for var sub in subselections {
        if sub.id == id {
          sub.isSelected = true
        } else {
          sub.isSelected = false
        }
      newSub.append(sub)
    }
    subselections = newSub
  }
  
  var labelText: String {
    return name.contains("milk") ? "milk" : "sugar"
  }
}

// MARK: - Mock data for uint testing and populating previews
extension Extra {
  static var DummyExtras: [Extra] {
    return [
      Extra(
        id: "60ba197c2e35f2d9c786c525",
        name: "Select the amount of sugar",
        subselections: [
          Subselection(id: "60ba194dfdd5e192e14eaa75", name: "A lot"),
          Subselection(id: "60ba195407e1dc8a4e33b5e5", name: "Normal"),
        ]
      ),
      Extra(
        id: "60ba34a0c45ecee5d77a0263",
        name: "Select type of milk",
        subselections: [
          Subselection(id: "611a1adeff35e4db9df19667", name: "Soy"),
          Subselection(id: "60ba348d8c75424ac5ed259e", name: "Oat"),
          Subselection(id: "60ba349a869d7a04642b41f4", name: "Cow"),
        ]
      )
    ]
  }
}
