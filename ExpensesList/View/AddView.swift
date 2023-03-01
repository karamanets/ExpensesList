//
//  AddExpenseView.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: ExpensesViewModel
    @StateObject var vm = AddViewModel()
    @Environment(\.dismiss) var  goBack
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("📜", text: $vm.expense.name)
                } header: {
                    Text("Enter the name")
                }
                Section {
                    Picker("📌", selection: $vm.expense.type) {
                        ForEach(vm.expense.types, id: \.self) {
                            Text($0)
                        }
                    }
                } header: {
                    Text("Enter the type")
                }
                Section {
                    TextField("💸", text: $vm.expense.amount)
                } header: {
                    Text("Enter the amound")
                }
                Section {
                    Picker("😎", selection: $vm.expense.reaction) {
                        ForEach(vm.expense.reactions, id: \.self){
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
                        if let actualAmount = Int(vm.expense.amount) {
                            let item = ExpensesModel(name: vm.expense.name, type: vm.expense.type, amount: actualAmount, reaction: vm.expense.reaction)
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
