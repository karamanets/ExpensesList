//
//  Data.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 26.12.2022.
//

import SwiftUI

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
