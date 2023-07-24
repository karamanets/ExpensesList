//
//  BackgroundColor.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.03.2023.
//

import SwiftUI

struct BackgroundMove: View {
    
    @State private var xDirection: CGFloat = .zero
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .offset(x: xDirection)
                .ignoresSafeArea()
        }
        .onAppear { moving() }
    }
    
    private func moving() {
        withAnimation(.easeInOut(duration: 2.5).repeatForever()) {
            xDirection = -16
        }
    }
}

func backgroundImage() -> some View {
    
    Image("background")
        .resizable()
        .ignoresSafeArea()
}
