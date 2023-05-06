//
//  CoffeesView.swift
//  CafeApp
//
//  Created by zero on 5/3/23.
//

import SwiftUI
import AlertToast
import RealmSwift

struct CoffeesView: View {
  
  @StateObject private var router = NavigationRouter()
  @StateObject private var viewModel = CoffeesViewModel(coffeeFetcher: FetchCoffeesService(requestManager: RequestManager()))
  
  @State private var isPresented = false
  @State private var showToast = false
  
  var body: some View {
    NavigationStack(path: $router.routes) {
      ZStack {
        Colors.background
          .edgesIgnoringSafeArea(.all)
        
        VStack {
          HeaderView(title: Constants.coffiesHeaderText)

          Spacer()
          
          List(viewModel.coffeeTypes) { type in
                CoffeeItemview(title: type.name, icon: type.name)
              .overlay {
                NavigationLink(type.name, value: Route.coffee(item: type))
                .opacity(0)
                
              }
              .modifier(ListItemStyle())
            
          }
          .modifier(ListPlainStyle())
          .navigationDestination(for: Route.self) { $0 }
          
        }
       
      }
      .navigationTitle(Constants.coffiesNavTitle)
      .onAppear{
        Task {
          await viewModel.getData()
        }
      }
      
    }
    .environmentObject(viewModel)
    .environmentObject(router)
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

struct CoffeesView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeesView()
        .environmentObject(CoffeesViewModel(coffeeFetcher: FetchCoffeesService(requestManager: RequestManager())))
    }
}
