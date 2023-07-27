//
//  Modifiers.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 24/07/2023.
//

import SwiftUI

struct CustomFont: ViewModifier {
    
    let font: Font.TextStyle
    
    private let fontName = "Lugrasimo-Regular"
    
    func body(content: Content) -> some View {
        content
            .font(.custom(fontName, size: fontSize, relativeTo: font))
            .shadow(color: .blue, radius: 2, x: 2, y: 2)
    }
    
    private var fontSize: CGFloat {
        switch font {
            
        case .largeTitle:
            return 34
        case .title:
            return 28
        case .title2:
            return 22
        case .title3:
            return 20
        case .headline:
            return 19
        case .subheadline:
            return 18
        case .body:
            return 17
        case .callout:
            return 16
        case .footnote:
            return 13
        case .caption:
            return 12
        case .caption2:
            return 11
        @unknown default:
            return 17
        }
    }
}
