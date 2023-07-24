//
//  Main.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

import SwiftUI

//MARK: Tasks
//1 STOP moving View when open keyboard
//2 Change text style and icon style
//3 Add adding to able move

struct ExpensesView: View {
    
    @StateObject var expenses  = ExpensesViewModel()
    
    @State private var showSheet = false
    
    private var listIsEmpty: Bool {
            expenses.items.isEmpty ? false : true
    }
    
    var body: some View {
        Group {
            if listIsEmpty {
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
                                Text("\(item.amount)")
                                    .font(.system(size: 22) .italic() .bold())
                            }
                        }
                        
                        .onDelete { item in
                            let revers = Array(expenses.items.reversed())
                            let collect = Set(item.map { revers[$0].id })
                            self.expenses.items.removeAll { collect.contains($0.id) }
                        }
                        .listRowBackground(Color.purple.opacity(0.5)
                            .blendMode(.hardLight)
                        )
                        .listRowSeparatorTint(Color.red)
                        
                    }
                    .scrollContentBackground(.hidden)
                    .background{ backgroundImage() }
                    .toolbarBackground(.hidden, for: .navigationBar)
                    .navigationTitle("Expenses")
                    .toolbar {
                        Button {
                            self.showSheet = true
                        } label: {
                            Image(systemName: "doc.text")
                                .font(.title2 .bold())
                        }
                    }
                }
            } else {
                VStack {
                    Greeting()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background{ BackgroundMove() }
                        .onTapGesture {
                            self.showSheet = true
                        }
                }
                .transition(.move(edge: .leading))
            }
        }
        .sheet(isPresented: $showSheet) { AddView(expenses: self.expenses) }
        .animation(.spring(), value: listIsEmpty)
    }
}
//                    🔱
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
    }
}

