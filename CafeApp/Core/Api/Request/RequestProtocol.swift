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
    return APIConstants.baseUrl
  }

  func createURLRequest() throws -> URLRequest {
    let urlString = host + path
    
    guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = requestType.rawValue

    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

    return urlRequest
  }
  
  
}
