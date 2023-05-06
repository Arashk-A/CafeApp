//
//  Route.swift
//  CafeApp
//
//  Created by zero on 5/5/23.
//

import SwiftUI


enum Route: View, Hashable {
  case coffee(item: CoffeeType)
  case size(item: Size)
  case overview
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(self.hashValue)
  }
  
  static func == (lhs: Route, rhs: Route) -> Bool {
    switch (lhs, rhs) {
      case (.coffee(let lhs), .coffee(item: let rhs)):
        return lhs.id == rhs.id
      
      case (.size(let lhs), .size(let rhs)):
        return lhs.id == rhs.id
      
      case (.overview, .overview):
        return true
      
      default:
        return false
    }
  }
  
  var body: some View {
    switch self {
      case .coffee(let type):
        CoffeeSizeView(selectedCoffee: type)
      case .size(let size):
        ExtrasView(selectedSize: size)
      case .overview:
        OverviewView()
    }
  }
  
}
