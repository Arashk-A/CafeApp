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
          Color.brown.opacity(0.4)
            .edgesIgnoringSafeArea(.all)

          VStack {

            HStack() {
              Text("Tab the machine to start")
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
              Text("How does this work")
                .font(.title3)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 8)
            .underline()
            
            Spacer()
          }
          .navigationTitle("Navigation")
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

class HomeViewModel: ObservableObject {
  @Published var presendCoffeView = false
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
