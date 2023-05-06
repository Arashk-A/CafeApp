//
//  CoffeesRequestMock.swift
//  CafeAppTests
//
//  Created by zero on 5/5/23.
//

@testable import CafeApp

import Foundation

enum CoffeesRequestMock: RequestProtocol {
  case getCoffees
  
  var path: String {
    guard let path = Bundle.main.path(forResource: "CoffeesMock", ofType: ".json") else {
      return ""
    }
    
    return path
  }
  
  var requestType: RequestType {
    .GET
  }
}
