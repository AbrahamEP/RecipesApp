//
//  RecipeTableViewCellViewModel.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 23/02/23.
//

import Foundation
import SDWebImage

class RecipeTableViewCellViewModel {
    var title: String
    var mealType: String
    var mealCountryOrigin: String
    var mealPictureUrl: String?
    
    init(meal: Meal) {
        self.title = meal.strMeal
        self.mealType = meal.strCategory
        self.mealCountryOrigin = meal.strArea
        self.mealPictureUrl = meal.strMealThumb
    }
}

extension RecipeTableViewCellViewModel {
    func configure(_ view: RecipeTableViewCell) {
        view.mealTitleLabel.text = self.title
        view.mealTypeLabel.text = "This is a: \(self.mealType)"
        view.originCountryLabel.text = "From: \(self.mealCountryOrigin)"
        guard let imageUrlString = self.mealPictureUrl, let imageUrl = URL(string: imageUrlString) else { return }
        view.mealImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "person.circle.fill"))
    }
}
