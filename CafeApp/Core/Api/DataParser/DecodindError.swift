//
//  DecodindError.swift
//  CafeApp
//
//  Created by zero on 5/5/23.
//

import Foundation

enum DecodindError: LocalizedError {
case decodingFailed(reason: String)
  
  public var errorDescription: String? {
    switch self {
      case .decodingFailed(let err):
        return "Docoding faild with: \(err)"
    }
  }
}
