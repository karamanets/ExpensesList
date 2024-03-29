//
//  Data.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 26.12.2022.
//

import SwiftUI

class ExpensesViewModel: ObservableObject {
    
    private let key = "items"
    
    @Published var items = [ExpensesModel]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(items) {
                UserDefaults.standard.set(data, forKey: key )
            }
        }
    }
    init() {
        if let item = UserDefaults.standard.data(forKey: key ) {
            let decoder = JSONDecoder()
            if let data = try? decoder.decode([ExpensesModel].self, from: item) {
                self.items = data
            }
        }
    }
}
