//
//  Data.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 26.12.2022.
//

import SwiftUI

class ExpensesViewModel: ObservableObject {
    
    @Published var items = [ExpensesModel]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(items) {
                UserDefaults.standard.set(data, forKey: "items")
            }
        }
    }
    init() {
        if let item = UserDefaults.standard.data(forKey: "items") {
            let decoder = JSONDecoder()
            if let data = try? decoder.decode([ExpensesModel].self, from: item) {
                self.items = data
            }
        }
    }
}
