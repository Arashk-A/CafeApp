//
//  TransparentView.swift
//  CafeApp
//
//  Created by zero on 5/5/23.
//

import SwiftUI

struct TransparentView: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    DispatchQueue.main.async {
      
      view.backgroundColor = .clear
      view.isOpaque = false
      view.superview?.isOpaque = false
      view.superview?.superview?.backgroundColor = .clear
    }
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {}
}
