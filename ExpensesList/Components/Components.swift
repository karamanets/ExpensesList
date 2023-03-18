//
//  Components.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 04.02.2023.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier {
    
    let padding: CGFloat
    
    func body(content: Content) -> some View {
        content
            .padding(.all, padding)
            .padding(.horizontal)
            .background(.purple)
            .blendMode(.hardLight)
            .cornerRadius(15)
    }
}

var getBackgrounds: some View {
    
    LinearGradient(colors: [.purple, .blue, .blue, .purple],
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
    .ignoresSafeArea()
}
