//
//  ExpensesModel.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 04.02.2023.
//

import Foundation


struct ExpensesModel: Identifiable, Codable {
    
    var id      = UUID()
    var name    : String
    var type    : String
    var amount  : Int
}


