//
//  RequestManager.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

protocol RequestManagerProtocol {
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
  let apiManager: APIManagerProtocol
  let parser: DataParserProtocol
  
  init(
    apiManager: APIManagerProtocol = APIManager(),
    parser: DataParserProtocol = DataParser()) {
    self.apiManager = apiManager
    self.parser = parser
  }
  
  func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
    let data = try await apiManager.perform(request)
    
    let obj: T = try parser.parse(data: data)
    
    return obj
  }
  
  
}
