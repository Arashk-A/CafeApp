//
//  RequestProtocol.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

protocol RequestProtocol {
  var path: String { get }
  
  var requestType: RequestType { get }
  
}

extension RequestProtocol {
  
  var host: String {
    APIConstants.baseUrl
  }

  func createURLRequest() throws -> URLRequest {
    var components = URLComponents()
    components.scheme = "https"
    components.host = host
    components.path = path
    
    guard let url = components.url else { throw NetworkError.invalidURL }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = requestType.rawValue

    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

    return urlRequest
  }
  
  
}
