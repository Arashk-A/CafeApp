//
//  ExtrasView.swift
//  CafeApp
//
//  Created by zero on 5/4/23.
//

import SwiftUI


struct ExtrasView: View {
  @EnvironmentObject var viewModel: CoffeesViewModel
  @EnvironmentObject var router: NavigationRouter
  
  var selectedSize: Size
    
  var body: some View {
    ZStack {
      Colors.background
        .edgesIgnoringSafeArea(.all)
      
      VStack() {
        HeaderView(title: Constants.selectExtrasText)
        
        Spacer()
        
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(viewModel.seletedExtras) { extra in
              ExpandableView(isExpanded: false, background: Color.clear) {
                
                CoffeeItemview(title: extra.labelText, icon: extra.labelText)
                
              } content: {
                VStack() {
                  ForEach(extra.subselections) { sub in
          
                    SelectionView(title: sub.name,
                                  isSelected: viewModel.selectedExtra[extra.id] == sub.id,
                                  showDevider: !(viewModel.isLastSubselection(extra, subId: sub.id)), selectAction:  {
                      viewModel.selectedExtra(extra, subId: sub.id)
                    })
                  }
                  
                }
                .background(Colors.selectionBackground)
                .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                .padding(.horizontal, 16)
                
              }// END OF Expandable
            
          }// END OF FOR EACH
          .padding(.bottom, 20)
          
          
        }// END OF SCROLL VIEW
        .padding(.horizontal, 20)
      
        Button(action: {
          router.push(to: .overview)
        }) {
            Image(systemName: "m.circle.fill")
              .font(.system(size: 60))
              .foregroundColor(Colors.iconBackground)
              .background(.white)
              .clipped()
              .cornerRadius(40, corners: [.topLeft, .topRight, .bottomRight])
              .shadow(color: .brown.opacity(0.6), radius: 6)
        }
        
      }
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .navigationBarItems(leading: BackButton())
      .onAppear {
        viewModel.getExtras(selectedSize)
      }

    }
  }
}

