//
//  ExpensesRow.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 02/08/2023.
//

import SwiftUI

struct ExpensesRow: View {
    
    var expenses: ExpensesModel
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(expenses.name)
                    .modifier(CustomFont(font: .title3))
                
                Text(expenses.type)
                    .modifier(CustomFont(font: .caption2))
            }
            
            Spacer()
            
            VStack (alignment: .trailing, spacing: 2) {
                Text("\(expenses.amount) 💰")
                    .modifier(CustomFont(font: .title2))
                
                Text(expenses.dataCreated.asShortDateString())
                    .modifier(CustomFont(font: .caption2))
            }
        }
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}

struct ExpensesRow_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesRow(expenses: ExpensesModel(name: "Coffee", type: "Else", amount: 330, dataCreated: Date()))
    }
}
