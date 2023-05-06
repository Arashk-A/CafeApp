//
//  ListPlainStyle.swift
//  CafeApp
//
//  Created by zero on 5/4/23.
//

import SwiftUI

struct ListPlainStyle: ViewModifier {
  
    func body(content: Content) -> some View {
        content
          .background(.clear)
          .scrollContentBackground(.hidden)
          .listStyle(PlainListStyle())
    }
}
