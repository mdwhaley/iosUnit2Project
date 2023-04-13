//
//  ExpenseHelper.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import Foundation

class ExpenseHelper {
    
    /**
     4.2 Create a static function called `calculateTotalSpent` that accepts an array of `Expense` and returns the total amount of money the user spent. Feel free to run the provided test to know if your code is correct.
     */
    static func calculateTotalSpent(expenses : [Expense]) -> Double {
        //return expenses.reduce(0, { $0 + $1.amount })
        var totalExpenses = 0.0
        for expense in expenses {
            totalExpenses += expense.amount
        }
        return totalExpenses
    }
    /**
     4.2 Create a static function called `getExpensesByCategory` that accepts an array of `Expense` and returns a dictionary where each key is a category and each value is an array of `Expense` belonging to that category. Feel free to run the provided test to know if your code is correct.
     */
    
    static func getExpensesByCategory(expenses: [Expense]) -> ([String : [Expense]]) {
//        let expensesByCategory = Dictionary(grouping: expenses, by: { $0.category })
//        return expensesByCategory
        var expensesByCategory = [String : [Expense]]()
        for expense in expenses {
            if expensesByCategory[expense.category] == nil {
                expensesByCategory[expense.category] = [expense]
            } else {
                expensesByCategory[expense.category]?.append(expense)
            }
        }
        return expensesByCategory
    }
}
