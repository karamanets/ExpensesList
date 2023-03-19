//
//  BackgroundColor.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.03.2023.
//

import SwiftUI

var getBackgrounds: some View {
    
    LinearGradient(colors: [.purple, .blue, .blue, .purple],
                   startPoint: .topLeading,
                   endPoint: .bottomTrailing)
    .ignoresSafeArea()
}
