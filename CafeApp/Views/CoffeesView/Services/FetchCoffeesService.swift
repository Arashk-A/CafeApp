//
//  FetchCoffeesService.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

protocol CoffeeFetcher {
  func fetchCoffees() async throws -> [Coffee]
}

struct FetchCoffeesService {
  private let requestManager: RequestManagerProtocol
  
  init(requestManager: RequestManagerProtocol = RequestManager()) {
    self.requestManager = requestManager
  }
  
}

extension FetchCoffeesService: CoffeeFetcher {
  func fetchCoffees() async throws -> [Coffee] {
    let coffees: [Coffee] = try await requestManager.perform(CoffeesRequest.getCoffees)
    
    return coffees
  }
}
