//
//  CafeAppApp.swift
//  CafeApp
//
//  Created by zero on 5/2/23.
//

import SwiftUI

@main
struct CafeAppApp: App {
    var body: some Scene {
        WindowGroup {
          let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            HomeView()
        }
    }
}
