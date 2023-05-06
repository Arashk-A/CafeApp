//
//  SelectionView.swift
//  CafeApp
//
//  Created by zero on 5/4/23.
//

import SwiftUI

struct SelectionView: View {
  var title: String
  var isSelected: Bool
  var showDevider: Bool
  var selectAction: () -> Void
  
  var innerBackground = Color.clear
    var body: some View {
      VStack {
        Button(action: selectAction) {
          
          HStack {
            Text(title)
            
            Spacer()
            Image(systemName: (isSelected) ? "checkmark.circle" : "circle")
              .font(.title)
            
          }
          .padding(.horizontal, 16)
          .font(.title3)
          .foregroundColor(.white)
          .frame(maxWidth: .infinity, alignment: .leading)
          .frame(height: 50)
          .padding(.vertical, 12)
          .background(innerBackground)
          .cornerRadius(12, corners: [.allCorners])
          
        }
        .padding(.horizontal, 20)
        
        
        if (showDevider) {
          Seperator()
        }
        
      }
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
      SelectionView(title: "", isSelected: false, showDevider: true, selectAction: {})
    }
}
