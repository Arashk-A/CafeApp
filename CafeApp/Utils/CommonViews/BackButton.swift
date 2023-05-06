//
//  BackButton.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import SwiftUI

struct BackButton: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
    var body: some View {
      Button(action: {
          self.presentationMode.wrappedValue.dismiss()
          }) {
              HStack {
                Image(systemName: "chevron.left")
                Text(Constants.coffiesNavTitle)
              }
              .foregroundColor(.black)
              .font(.system(.title3, weight: .bold))
          }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
