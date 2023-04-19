//
//  CategoriesViewController.swift
//  DMExpenseTrackerBasic
//
//  Created by David Ruvinskiy on 3/27/23.
//

import UIKit

/**
 1.1 Create the user interface. See the provided screenshot for how the UI should look. Feel free to customize the colors, font, etc.
 1.2 Use the constants in the `Constants` file to assign the tableviews' reuse IDs and the second screen's storyboard ID.
 */
class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    /**
     2.1 Connect the UITableView to the code.
     */
    
    @IBOutlet weak var categoryTable: UITableView!
    /**
     3.1 Follow the steps in the `Expense` file.
     3.2 Create a [String: [Expense]] variable called expensesByCategory and initialize it to an empty dictionary.
     3.3 Create a [String] variable called expensesByCategory and initialize it to an empty array.
     
     We will assign the correct data to the variables soon.
     */
    var expensesByCategory: [String: [Expense]] = [:]
    var categories: [String] = []
    /**
     8.1 Call the `configureViewController` and `configureTableView` functions.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    /**
     4.1 Set the `CategoriesViewController`'s title to be "Categories".
     4.2 Follow the steps in the `ExpenseHelper` file.
     4.3 Use `ExpenseHelper` to assign the correct data to `expensesByCategory.
     4.4 Use `expensesByCategory` to get an array of categories and assign the result to `categories`.
     */
    func configureViewController() {
        expensesByCategory = ExpenseHelper.getExpensesByCategory(expenses: Expense.expenses)
        for (key, _) in expensesByCategory {
            categories.append(key)
        }
    }
    
    /**
     5.1 Have the `CategoriesViewController` conform to the `UITableViewDelegate` and `UITableViewDataSource` protocols. Set the `tableView`'s `delegate` and `dataSource` to self. The number of rows in section should be the number of categories we have. Each cell should display the category at the corresponding index in `expensesByCategory`. We will not be using a custom cell for this UITableView.
     5.1 Follow the steps in the `ExpensesViewController` file.
     5.2 Implement the `didSelectRowAt` function. Tapping on a cell should transition the user to the second screen. You may find the following article helpful: https://www.hackingwithswift.com/example-code/uikit/how-to-use-dependency-injection-with-storyboards.
     */
    func configureTableView() {
        categoryTable.delegate = self
        categoryTable.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.categoryReuseID, for: indexPath)
        let category = categories[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = category
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: Constants.expensesStoryboardID) as? ExpensesViewController else {
            fatalError("Failed to load EditUserViewController from storyboard.")
        }
        let category = categories[indexPath.row]
        secondVC.categoryText = category
        secondVC.expenseArray = expensesByCategory[category]!
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

