//
//  AddExpenseView.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

/*
 Tasks 🦉
 1. Add logotype 📌
 2. Mode adapt   📌
 */

import SwiftUI

struct AddExpenseView: View {
    
    @ObservedObject var expenses: Expenses
    
    @Environment(\.dismiss) var  goBack
    
    @State private var name   = ""
    @State private var type   = "Personal"
    @State private var amound = ""
    @State private var reaction = "📌"
    
    @State private var types = ["Personal", "Business", "Work", "Home", "Else"]
    @State private var reactions = ["😀", "😅", "😏", "☹️", "😭", "🛑", "🙉", "🔥", "📌", "🪓", "😇", "🤪", "🤩", "🥳", "😖", "😞", "🫣", "🤔", "🤡"]
    
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
                    TextField("💸", text: $amound)
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
                        if let actualAmound = Int(self.amound) {
                            let item = Expense(name: self.name, type: self.type, amound: actualAmound, reaction: self.reaction)
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

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView(expenses: Expenses())
    }
}
