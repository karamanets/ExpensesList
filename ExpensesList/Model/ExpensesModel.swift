//
//  ExpensesModel.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 04.02.2023.
//

import Foundation


struct Expense: Identifiable, Codable {
    
    var id      = UUID()
    var name    : String
    var type    : String
    var amount  : Int
    var reaction: String
}
