//
//  HomeViewModel.swift
//  CafeApp
//
//  Created by zero on 5/5/23.
//

import Foundation

class HomeViewModel: ObservableObject {
  @Published var presendCoffeView = false
  
  init(presendCoffeView: Bool = false) {
    self.presendCoffeView = presendCoffeView
    
    if !UserDefaults.isFirstTimePassed {
      UserDefaults.setFirstTimeLoaded()
    }
  }
}
