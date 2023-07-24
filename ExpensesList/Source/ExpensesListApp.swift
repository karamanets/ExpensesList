//
//  ExpensesListApp.swift
//  ExpensesList
//
//  Created by Alex Karamanets on 19.12.2022.
//

import SwiftUI

@main
struct ExpensesListApp: App {
    var body: some Scene {
        WindowGroup {
            ExpensesView()
                .preferredColorScheme(.dark)
        }
    }
}
