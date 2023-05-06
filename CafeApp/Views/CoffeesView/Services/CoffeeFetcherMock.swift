//
//  CoffeeFetcherMock.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

struct CoffeeFetcherMock: CoffeeFetcher {
  func fetchCoffees() async throws -> [Coffee] {
    return Coffee.mock
  }
  
//  func fetchCoffees() async throws -> [Coffee] {
//    return Coffee.mock
//  }
}
