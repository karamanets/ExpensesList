//
//  Greeting.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.03.2023.
//

import SwiftUI

struct Greeting: View {
    
    @State private var shadow1: CGFloat = -10
    @State private var shadow2: CGFloat = 10
    @State private var shadow3: CGFloat = 20
    
    
    var body: some View {
        ZStack {
            Text("Add Expense")
                .foregroundColor(.white)
                .font(.system(size: 33 , weight: .bold))
                .shadow(color: .purple, radius: shadow3, x: 3, y: 3)
                .shadow(color: .purple, radius: 4, x: -3, y: -3)
                .shadow(color: .purple, radius: shadow3, x: shadow1, y: shadow2)
                .shadow(color: .purple, radius: 10, x: shadow1, y: shadow2)
                .shadow(color: .pink, radius: shadow3, x: shadow1, y: shadow2)
                .shadow(color: .pink, radius: 20, x: shadow1, y: -30)
                .shadow(color: .purple, radius: shadow3, x: shadow1, y: shadow2)
                .shadow(color: .purple, radius: 30, x: shadow1, y: shadow2)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                shadow1 = 10
                shadow2 = -10
                shadow3 = 5
            }
        }
    }
}

//                   🔱
struct Greeting_Previews: PreviewProvider {
    static var previews: some View {
        Greeting()
    }
}
