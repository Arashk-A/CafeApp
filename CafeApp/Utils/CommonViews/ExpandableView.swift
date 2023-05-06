//
//  ExpandableView.swift
//  CafeApp
//
//  Created by zero on 5/4/23.
//

import SwiftUI

struct ExpandableView<Header: View, Content: View>: View {
  
  @State var isExpanded: Bool = true
  
  var background: Color
  var label: () -> Header
  var content: () -> Content
  
  var body: some View {
    VStack(spacing: 0) {
      Button(action: {
        withAnimation {
          isExpanded.toggle()
        }
      }) {
        label()
      }
      .background(background)
      
      if isExpanded {
        VStack {
          content()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: isExpanded ? .none : 0)
        .clipped()
      }
    }
  }
  
}
