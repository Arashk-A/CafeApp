//
//  Seperator.swift
//  CafeApp
//
//  Created by zero on 5/4/23.
//

import SwiftUI

struct Seperator: View {
  var height: CGFloat = 2
  
    var body: some View {
      Rectangle()
        .fill(.white)
        .frame(height: height)
        .padding(.horizontal, 16)
    }
}

struct Seperator_Previews: PreviewProvider {
    static var previews: some View {
        Seperator()
        
    }
}
