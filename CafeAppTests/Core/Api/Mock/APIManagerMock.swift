//
//  APIManagerMock.swift
//  CafeAppTests
//
//  Created by zero on 5/5/23.
//

@testable import CafeApp

import Foundation

class APIManagerMock: APIManagerProtocol {
  func perform(_ request: RequestProtocol) async throws -> Data {
    return try Data(contentsOf: URL(fileURLWithPath: request.path), options: Data.ReadingOptions.mappedIfSafe)
  }
  
}
