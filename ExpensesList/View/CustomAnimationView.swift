//
//  CustomAnimationView.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 18.03.2023.
//

import SwiftUI

struct CustomAnimationView: View {
    
    @State private var rotation: CGFloat = 3600
    
    var body: some View {
        
        ZStack  {
                ForEach(0..<9) { item in
                    CustomPath2_1()
                        .stroke(style: StrokeStyle(lineWidth: 5))  // - линия
                        .fill( LinearGradient(colors: [.purple],
                                                         startPoint: .topTrailing,
                                                         endPoint: .bottomLeading))
                        .shadow(color: .orange, radius: 10, x: 3, y: 3)
                        
                        .frame(width: 220, height: 220)
                        .rotationEffect(Angle(degrees: 90 + Double(item * 4) ))
                        
                }
        }
        .rotationEffect(.degrees(rotation))
        .onAppear {
            withAnimation(.linear(duration: 30).repeatForever()) {
            
                
                rotation = 0
            
            }
        }
    }
}

struct CustomPath2_1: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

//                     🔱
struct CustomAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAnimationView()
    }
}


//let animation = Animation.easeInOut(duration: 3)
//let rep = animation
//    .repeatForever()
//return withAnimation(rep) { self.rotation = 0 }
