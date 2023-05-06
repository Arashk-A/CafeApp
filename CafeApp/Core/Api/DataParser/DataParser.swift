//
//  DataParser.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation



protocol DataParserProtocol {
  func parse<T: Decodable>(data: Data) throws -> T
}

class DataParser: DataParserProtocol {
  private var jsonDecoder: JSONDecoder

  init(jsonDecoder: JSONDecoder = JSONDecoder()) {
    self.jsonDecoder = jsonDecoder
    self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
  }

  func parse<T: Decodable>(data: Data) throws -> T {
    do {
      return try jsonDecoder.decode(T.self, from: data)
      
    } catch let error {
      throw DecodindError.decodingFailed(reason: error.localizedDescription)
    }
    
  }
}
