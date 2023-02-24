//
//  RecipesResultsViewModel.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 23/02/23.
//

import Foundation

class RecipesResultsViewModel {
    private var apiService = APIService()
    var meals: [Meal] = []
    
    func fetchRecipes(completion: ((MealResults?, String?) -> Void)?) {
        self.apiService.fetchRecipes { result, errorMessage in
            guard let result = result, let completion = completion else {
                if let completion = completion {
                    completion(nil, errorMessage)
                }
                return
            }
            self.meals = result.meals
            completion(result, nil)
        }
    }
}
