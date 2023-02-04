//
//  AddExpenseView.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: ExpensesViewModel

    @State private var name   = ""
    @State private var type   = "Personal"
    @State private var amount = ""
    @State private var types  = ["Personal", "Business", "Work", "Home", "Else"]
    @State private var reactions = Components.emoji
    @State private var reaction = "📌"
    
    @Environment(\.dismiss) var  goBack
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("📜", text: $name)
                } header: {
                    Text("Enter the name")
                }
                Section {
                    Picker("📌", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Enter the type")
                }
                Section {
                    TextField("💸", text: $amount)
                } header: {
                    Text("Enter the amound")
                }
                Section {
                    Picker("😎", selection: $reaction) {
                        ForEach(reactions, id: \.self){
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Enter reaction")
                }
            }
            .navigationTitle("Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement .navigationBarLeading) {
                    Button {
                        goBack()
                    } label: {
                        Image(systemName: "arrow.uturn.backward")
                            .font(.system(size: 20) .bold())
                    }
                }
                ToolbarItem(placement: ToolbarItemPlacement .navigationBarTrailing) {
                    Button {
                        if let actualAmound = Int(self.amount) {
                            let item = Expense(name: self.name, type: self.type, amount: actualAmound, reaction: self.reaction)
                            self.expenses.items.append(item)
                            goBack()
                        }
                    } label: {
                        Text("Save")
                            .font(.system(size: 20) .bold())
                    }
                }
            }
        }
    }
}
//                     📌
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: ExpensesViewModel())
    }
}
