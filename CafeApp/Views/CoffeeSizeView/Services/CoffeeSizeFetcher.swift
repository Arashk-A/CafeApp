//
//  CoffeeSizeFetcher.swift
//  CafeApp
//
//  Created by zero on 5/5/23.
//

import Foundation

protocol CoffeeSizeFetcher {
  func fetchCoffeeSizes() async throws -> [Size]
}

struct FetchCoffeeSizeService {
  private let requestManager: RequestManagerProtocol
  
  init(requestManager: RequestManagerProtocol = RequestManager()) {
    self.requestManager = requestManager
  }
  
}

extension FetchCoffeeSizeService: CoffeeSizeFetcher {
  func fetchCoffeeSizes() async throws -> [Size] {
    let sizes: [Size] = try await requestManager.perform(CoffeesRequest.getCoffees)
    
    return sizes
  }
}
