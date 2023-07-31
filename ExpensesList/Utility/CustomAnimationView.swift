//
//  CustomAnimationView.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 18.03.2023.
//

import SwiftUI

struct CustomAnimationView: View {
    
    @State private var rotation: CGFloat = 720
    @State private var rotation2: CGFloat = 0
    
    var body: some View {
        ZStack {
            ZStack  {
                ForEach(0..<9) { item in
                    CustomPath()
                        .stroke(style: StrokeStyle(lineWidth: 5))
                        .fill( LinearGradient(colors: [.purple],
                                              startPoint: .topTrailing,
                                              endPoint: .bottomLeading))
                        .shadow(color: .orange, radius: 10, x: 3, y: 3)
                        .frame(width: 150, height: 150)
                        .rotationEffect(Angle(degrees: 90 + Double(item * 3) ))
                }
            }
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever()) {
                    rotation = 0
                }
            }
            ZStack  {
                ForEach(0..<9) { item in
                    CustomPath()
                        .stroke(style: StrokeStyle(lineWidth: 5))
                        .fill( LinearGradient(colors: [.purple],
                                              startPoint: .topTrailing,
                                              endPoint: .bottomLeading))
                        .shadow(color: .pink, radius: 10, x: 3, y: 3)
                        .frame(width: 150, height: 150)
                        .rotationEffect(Angle(degrees: 90 + Double(item * 3) ))
                }
            }
            .rotationEffect(.degrees(rotation2))
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever()) {
                    rotation2 = 720
                }
            }
        }
    }
}

//                     🔱
struct CustomAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimationView()
    }
}
