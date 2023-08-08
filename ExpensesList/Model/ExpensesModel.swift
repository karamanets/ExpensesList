//
//  ExpensesModel.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 04.02.2023.
//

import Foundation


struct ExpensesModel: Identifiable, Codable {
    
    var id         = UUID()
    let name       : String
    let type       : String
    let amount     : Int
    let dataCreated: Date
    
}


