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
        VStack{
            ScrollView {
                VStack (spacing: 16) {
                    VStack {
                        Text("Enter the name")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("📜", text: $vm.expense.name)
                            .modifier(TextFieldModifier(padding: 15))
                    }
                    VStack {
                        Text("Enter the type")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Picker("", selection: $vm.expense.type) {
                            ForEach(vm.expense.types, id: \.self) {
                                Text($0)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .modifier(TextFieldModifier(padding: 10))
                    }
                    VStack {
                        Text("Enter the amount")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        TextField("💸", text: $vm.expense.amount)
                            .modifier(TextFieldModifier(padding: 15))
                    }
                    ZStack {
                        Text("Save")
                            .modifier(TextFieldModifier(padding: 6))
                        CustomAnimationView()
                    }
                    .padding(.top, 90)
                    .onTapGesture {
                        if let actualAmount = Int(vm.expense.amount) {
                            let item = ExpensesModel(name: vm.expense.name, type: vm.expense.type, amount: actualAmount)
                            self.expenses.items.append(item)
                            goBack()
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            
        }
        .scrollContentBackground(.hidden)
        .toolbarBackground(.hidden, for: .navigationBar)
        .background(getBackgrounds)
    }
}
//                     🔱
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: ExpensesViewModel())
    }
}

