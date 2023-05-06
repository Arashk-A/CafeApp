//
//  NavigationRouter.swift
//  CafeApp
//
//  Created by zero on 5/5/23.
//

import SwiftUI

final class NavigationRouter: ObservableObject {
  @Published var routes = [Route]()
  
  func push(to screen: Route) {
    routes.append(screen)
  }
  
}
