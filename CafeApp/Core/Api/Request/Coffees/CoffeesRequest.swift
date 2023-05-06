//
//  CoffeesRequest.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

enum CoffeesRequest: RequestProtocol {
  case getCoffees
  case getSizes
  
  var path: String {
    switch self {
      case .getCoffees:
        return "coffies"
      case .getSizes:
        return "sizes"
    }
  }
  
  var requestType: RequestType {
    switch self {
      case .getCoffees, .getSizes:
        return .GET
    }
    
  }
}
