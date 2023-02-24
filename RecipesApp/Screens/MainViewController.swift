//
//  MainViewController.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 21/02/23.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    private var apiService = APIService()
    private var mealResultsViewModel = RecipesResultsViewModel()
    private var meals: [Meal] {
        self.mealResultsViewModel.meals
    }
    var currentMeal: Meal?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        
        let loader = self.loader()
        self.mealResultsViewModel.fetchRecipes { [weak self] result, errorMessage in
            guard let self = self else { return }
            loader.stopLoader(loader: loader)
            if let _ = result {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
            guard let errorMessage = errorMessage else { return }
            let okAction = UIAlertAction(title: "Ok", style: .default)
            self.showAlert(title: "Error", message: errorMessage, style: .alert, actions: [okAction])
        }
    }
    
    //MARK: - Helper methods
    private func setupViews() {
        self.title = "Recipes"
        
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: RecipeTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: RecipeTableViewCell.reuseIdentifier)
        self.tableView.rowHeight = 120
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.reuseIdentifier, for: indexPath) as! RecipeTableViewCell
        
        let meal = self.meals[indexPath.row]
        let recipeCellViewModel = RecipeTableViewCellViewModel(meal: meal)
        recipeCellViewModel.configure(cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.currentMeal = self.meals[indexPath.row]
        let detailVC = RecipeDetailViewController()
        detailVC.meal = self.currentMeal!
        
        self.navigationController?.show(detailVC, sender: self)
    }
    
}
