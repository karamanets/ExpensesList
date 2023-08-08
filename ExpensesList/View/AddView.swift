//
//  AddExpenseView.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

import SwiftUI

//1 add redact expenses
//2 add Date

struct AddView: View {
    
    @StateObject var vm = AddViewModel()
    
    @ObservedObject var expenses: ExpensesViewModel
    
    @Environment(\.dismiss) var  goBack
    
    var body: some View {
        Group {
            ScrollView {
                VStack (spacing: 16) {
                    
                    textFieldName()
                   
                    textFieldType()
                    
                    textFieldAmount()
                    
                    ZStack {
                        CustomAnimationView()
                        Button {
                            addExpenses()
                        } label: {
                            saveButtonView()
                        }
                        
                    }
                    .padding(.top, 50)
                }
                .modifier(CustomFont(font: .body))
                .padding(.horizontal)
                .padding(.top, 30)
            }
        }
        .scrollContentBackground(.hidden)
        .toolbarBackground(.hidden, for: .navigationBar)
        .background{ backgroundImage() }
    }
}

//MARK: - Component
private extension AddView {
    
    func addExpenses() {
        if let actualAmount = Int(vm.expense.amount), !vm.expense.name.isEmpty {
            let item = ExpensesModel(name: vm.expense.name,
                                     type: vm.expense.type,
                                     amount: actualAmount,
                                     dataCreated: .now)
            self.expenses.items.append(item)
            goBack()
        }
    }
    
    func saveButtonView() -> some View {
        ZStack {
            Circle()
                .fill(Color.purple)
                .frame(width: 50, height: 50)
                .overlay {
                    Circle()
                        .stroke(Color.pink, lineWidth: 0.6)
                }
            Text("Save")
                .foregroundColor(.black)
        }
    }
    
    func textFieldName() -> some View {
        VStack {
            Text("Enter the name")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("📜", text: $vm.expense.name)
                .modifier(TextFieldModifier(padding: 15))
        }
    }
    
    func textFieldType() -> some View {
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
    }
    
    func textFieldAmount() -> some View {
        VStack {
            Text("Enter the amount")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("💸", text: $vm.expense.amount)
                .modifier(TextFieldModifier(padding: 15))
                .keyboardType(.numbersAndPunctuation)
        }
    }
    
}

//                     🔱
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: ExpensesViewModel())
            .preferredColorScheme(.dark)
    }
}

