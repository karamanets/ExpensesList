//
//  Main.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

import SwiftUI

struct ExpensesView: View {
    
    @StateObject var expenses  = ExpensesViewModel()
    @State private var sheetLink = false
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(expenses.items.reversed()) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.system(size: 22) .italic() .bold())
                            Text(item.type)
                                .font(.system(size: 16) .lowercaseSmallCaps())
                        }
                        Spacer()
                        Text("\(item.reaction)")
                            .padding(.trailing, 15)
                            
                        Text("\(item.amount)")
                            .font(.system(size: 22) .italic() .bold())
                    }
                }
                .onDelete { item in
                    let revers = Array(expenses.items.reversed())
                    let collect = Set(item.map { revers[$0].id })
                    self.expenses.items.removeAll { collect.contains($0.id) }
                }
            }
            .navigationTitle("Expenses")
            .sheet(isPresented: $sheetLink) { AddView(expenses: self.expenses) }
            .toolbar {
                Button {
                    self.sheetLink = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
//                    📌
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}
