//
//  OverviewView.swift
//  CafeApp
//
//  Created by zero on 5/4/23.
//

import SwiftUI

struct OverviewView: View {
  @EnvironmentObject var coffeeViewModel: CoffeesViewModel
  @EnvironmentObject var homeViewModel: HomeViewModel
  
  func isLastItem(extra: Extra) -> Bool {
    let index = coffeeViewModel.seletedExtras.firstIndex { ex in
      ex.id == extra.id
    }
    return (coffeeViewModel.seletedExtras.count - 1) == index
  }
  
    var body: some View {
      ZStack {
        Colors.background
          .edgesIgnoringSafeArea(.all)
        
        VStack() {
          HeaderView(title: Constants.overviewText)
          
          Spacer()
          
          ScrollView(.vertical, showsIndicators: false) {
            VStack {
              
              if let coffee = coffeeViewModel.selectedCoffee {
                CoffeeItemview(title: coffee.name, icon: coffee.name, showEdit: true, cornerRadius: 0, background: .clear)
                Seperator()
              }
              
              if let size = coffeeViewModel.selectedSize {
                CoffeeItemview(title: size.name, icon: size.name, showEdit: true, cornerRadius: 0, background: .clear)
                Seperator()
              }
              
              ForEach(coffeeViewModel.seletedExtras) { extra in
                CoffeeItemview(title: extra.labelText, icon: extra.labelText, showEdit: true, cornerRadius: 0, background: .clear)
                Seperator()
                
                if let sub = extra.subselections.filter({ $0.id == coffeeViewModel.selectedExtraSub[extra.id] }).first {
                  
                  SelectionView(
                    title: sub.name,
                    isSelected: true,
                    showDevider: !isLastItem(extra: extra),
                    selectAction: {},
                    innerBackground: Color(uiColor: UIColor(red: 87/255, green: 81/255, blue: 79/255, alpha: 1))
                  )
                    .padding(.horizontal, 12)
                    .cornerRadius(12, corners: [.allCorners])
                    
                }
              }
            }
            .background(
              RoundedRectangle(cornerRadius: 16,style: .continuous)
                .fill(Colors.listBackground)
                .padding(.bottom, -16)
                
            )
            .padding(.horizontal, 20)
            
          }
          
          Button(action: {
            homeViewModel.presendCoffeView = false
          }) {
            
            HStack {
              Text(Constants.brewTheCoffee)
                .padding(.horizontal)
                .font(.system(size: 20))
                .bold()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 70)
            .background(Colors.listBackground)
            .cornerRadius(16)
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            
          }
          
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton())
        
      }
    }
}

struct Overview_Previews: PreviewProvider {
    static var previews: some View {
      OverviewView()
        .environmentObject(CoffeesViewModel(coffeeFetcher: CoffeeFetcherMock()))
        .environmentObject(HomeViewModel())
    }
}
