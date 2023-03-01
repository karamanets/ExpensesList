//
//  AddModel.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 01.03.2023.
//

import Foundation

struct AddModel {
    
    var name   = ""
    var type   = "Personal"
    var amount = ""
    var types  = ["Personal", "Business", "Work", "Home", "Else"]
    var reactions = Components.emoji
    var reaction = "📌"
}
