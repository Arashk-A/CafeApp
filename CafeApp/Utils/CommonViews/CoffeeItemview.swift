//
//  CoffeeItemview.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import SwiftUI

struct CoffeeItemview: View {
  
  var title: String
  var icon: String
  
  var showEdit: Bool = false
  var cornerRadius: CGFloat = 16
  var background = Colors.listBackground
  
    var body: some View {
      HStack {
        
        ZStack {
          Colors.iconBackground
            .frame(width: 70, height: 70)
            .cornerRadius(35)
            
          
          Image(icon)
            .resizable()
            .scaledToFit()
            .frame(width: 40)
            
          
        }
        .padding(.leading)
        
        Text(title)
          .padding(.horizontal)
          .font(.system(size: 18))
          .bold()
        
        if (showEdit) {
          Spacer()
          
          Button(action: {}) {
            Text("edit")
              .padding(.trailing, 16)
          }
        }
        
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .frame(height: 100)
      .background(background)
      .cornerRadius(cornerRadius)
      .foregroundColor(.white)
    }
}

struct CoffeeItemview_Previews: PreviewProvider {
    static var previews: some View {
      CoffeeItemview(title: "Ristretto", icon: "Ristretto")
    }
}
