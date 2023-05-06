//
//  CoffesMock.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import Foundation

private func loadCoffee() -> [Coffee] {
  guard let url = Bundle.main.url(forResource: "CoffeesMock", withExtension: "json"),
        let data = try? Data(contentsOf: url) else { return [] }
  
  let decoder = JSONDecoder()
  
  decoder.keyDecodingStrategy = .convertFromSnakeCase
  
  let mock = try? decoder.decode([Coffee].self, from: data)
  
  return mock ?? []
}

extension Coffee {
  static let mock = loadCoffee()
}
