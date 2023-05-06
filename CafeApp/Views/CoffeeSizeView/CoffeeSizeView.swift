//
//  CoffeeSizeView.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import SwiftUI
import AlertToast

struct CoffeeSizeView: View {
  @EnvironmentObject var coffeesViewModel: CoffeesViewModel
  @EnvironmentObject var router: NavigationRouter
  
  @StateObject var viewModel = CoffeeSizeViewModel(sizeFetcher: FetchCoffeeSizeService())

  @State private var isPresented = false
  @State private var showToast = false
  
  var selectedCoffee: CoffeeType
  
    var body: some View {
      ZStack {
        Colors.background
        .edgesIgnoringSafeArea(.all)
        
        VStack {
          HeaderView(title: Constants.selectYourSize)
          
          Spacer()

          List(viewModel.availableSizes) { type in

              CoffeeItemview(title: type.name, icon: type.name)
                .overlay {
                  NavigationLink(type.name, value: Route.size(item: type))
                  .opacity(0)

                }
                .modifier(ListItemStyle())
            }
          
            .modifier(ListPlainStyle())
          
        }
          
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        .onAppear {
          Task {
            await viewModel.getSizes(coffee: selectedCoffee)
            coffeesViewModel.selectedCoffee = selectedCoffee
          }
        }
        .fullScreenCover(isPresented: $isPresented) {
          LoadingView(isAnimating: $isPresented)
        }
        .toast(isPresenting: $showToast, alert: {
          AlertToast(type: .error(.red), title: viewModel.errorMessage)
        }, completion:  {
          viewModel.error = false
        })
        .onReceive(viewModel.$isLoading, perform: { value in
          isPresented = value
        })
        .onReceive(viewModel.$error, perform: { value in
            showToast = value
        })
      }
  
}
