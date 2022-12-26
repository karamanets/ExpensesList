//
//  Main.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

import SwiftUI

struct Main: View {
    
    @State private var sheetLink = false
    @ObservedObject var expenses  = Expenses()
    
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
                            
                        
                        Text("\(item.amound)")
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
            .sheet(isPresented: $sheetLink) { AddExpenseView(expenses: self.expenses) }
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

struct Expense: Identifiable, Codable {
    
    var id      = UUID()
    var name    : String
    var type    : String
    var amound  : Int
    var reaction: String
    
}

class Expenses: ObservableObject {
    
    @Published var items = [Expense]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(items) {
                UserDefaults.standard.set(data, forKey: "itemsData")
            }
        }
    }
    init() {
        if let item = UserDefaults.standard.data(forKey: "itemsData") {
            let decoder = JSONDecoder()
            if let data = try? decoder.decode([Expense].self, from: item) {
                self.items = data
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
