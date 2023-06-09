//
//  Networkerror.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

enum NetworkError: LocalizedError {
  case invalidServerResponse
  case invalidURL
  
  public var errorDescription: String? {
    switch self {
    case .invalidServerResponse:
      return "The server returned an invalid response."
    case .invalidURL:
      return "URL string is malformed."
    }
  }
}
