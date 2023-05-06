//
//  ListItemStyle.swift
//  CafeApp
//
//  Created by zero on 5/4/23.
//

import SwiftUI

struct ListItemStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .listRowSeparator(.hidden)
        .listRowSeparatorTint(.clear)
        .listRowBackground(Color.clear)
    }
}
