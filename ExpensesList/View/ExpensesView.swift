//
//  Main.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

import SwiftUI

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
                        ForEach(expenses.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .modifier(CustomFont(font: .title2))
                                    
                                    Text(item.type)
                                        .modifier(CustomFont(font: .caption))
                                }
                                Spacer()
                                Text("\(item.amount)")
                                    .modifier(CustomFont(font: .title2))
                            }
                        }
                        .onDelete(perform: deleteExpenses )
                        .onMove(perform: moveExpenses )
                        .listRowBackground(Color.purple.opacity(0.4))
                        .listRowSeparatorTint(Color.red.opacity(0.4))
                    }
                    .environment(\.defaultMinListRowHeight, 40)
                    .scrollContentBackground(.hidden)
                    .background{ backgroundImage() }
                    .toolbarBackground(.hidden, for: .navigationBar)
                    .navigationTitle("Expenses")
                    .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: .zero, content: {
                        addExpensesButton()
                    })
                    .toolbar { aditButton() }
                }
            } else {
                greetingView()
                    .transition(.move(edge: .leading))
            }
        }
        .sheet(isPresented: $showSheet) { AddView(expenses: self.expenses) }
        .animation(.spring(), value: listIsEmpty)
    }
}

//MARK: - Component
private extension ExpensesView {
    
    func aditButton() -> some View {
        EditButton()
            .modifier(CustomFont(font: .body))
            .foregroundStyle(LinearGradient(colors: [.pink, .purple],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing))
    }
    
    func addExpensesButton() -> some View {
        Button {
            self.showSheet = true
        } label: {
            ZStack {
                Circle()
                    .fill(Color.purple.opacity(0.5))
                    .frame(width: 60, height: 60)
                
                Image(systemName: "plus")
                    .font(.title2 .bold())
                    .foregroundColor(.white)
            }
            .shadow(color: .black, radius: 2, x: 1, y: 1)
            .padding()
        }
    }
    
    func greetingView() -> some View {
        VStack {
            Greeting()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background{ BackgroundMove() }
                .onTapGesture {
                    self.showSheet = true
                }
        }
    }
    
    func deleteExpenses(index: IndexSet) {
        expenses.items.remove(atOffsets: index)
    }
    
    func moveExpenses(from: IndexSet, to: Int) {
        expenses.items.move(fromOffsets: from, toOffset: to)
    }
}

//                    🔱
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
            .preferredColorScheme(.dark)
    }
}

