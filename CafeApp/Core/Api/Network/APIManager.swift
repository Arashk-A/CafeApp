//
//  APIManager.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

protocol APIManagerProtocol {
  func perform(_ request: RequestProtocol) async throws -> Data
}


class APIManager: APIManagerProtocol {
  
  private let urlSession: URLSession
  
  init(urlSession: URLSession = URLSession.shared) {
    self.urlSession = urlSession
  }
  
  func perform(_ request: RequestProtocol) async throws -> Data {
    
    let (data, reponse) = try await urlSession.data(for:
                                                      request.createURLRequest())
    guard let httpResponse = reponse as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      
      throw NetworkError.invalidServerResponse
    }
    
    return data
  }
}
