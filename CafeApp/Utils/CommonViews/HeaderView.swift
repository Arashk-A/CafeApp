//
//  HeaderView.swift
//  CafeApp
//
//  Created by zero on 5/4/23.
//

import SwiftUI

struct HeaderView: View {
  
  var title: String
    
    var body: some View {
      HStack() {
        Text(title)
          .font(.title)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.bottom)
      .padding(.leading)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
      HeaderView(title: Constants.coffiesHeaderText)
    }
}
