//
//  HomeView.swift
//  CafeApp
//
//  Created by zero on 5/2/23.
//

import SwiftUI

struct HomeView: View {
  
  @State private var isPresented = false
  @StateObject var viewModel = HomeViewModel()
  
    var body: some View {

      NavigationView {

        ZStack {
          Colors.background
            .edgesIgnoringSafeArea(.all)

          VStack {

            HStack() {
              Text(Constants.homeHeaderText)
                .font(.title)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Spacer()

            Button(action: {
              isPresented.toggle()
            }) {
              Image("nfc")
              .resizable()
              .scaledToFit()
              .tint(.green)
            }
            .padding(.top, -110)
            
            HStack() {
              Text(Constants.homeFooterText)
                .font(.title3)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
            .underline()
            
            Spacer()
          }
          .navigationTitle(Constants.homeNavTitle)
          .padding(.horizontal, 20)

        }// END Of ZStack
        .fullScreenCover(isPresented: $isPresented, content: {
          CoffeesView().environmentObject(viewModel)
        })
        .onReceive(viewModel.$presendCoffeView) { present in
          isPresented = present
        }
    

      }
      
    
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
