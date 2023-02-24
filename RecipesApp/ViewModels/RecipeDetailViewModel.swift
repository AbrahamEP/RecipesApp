//
//  RecipeDetailViewModel.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 23/02/23.
//

import Foundation
import CoreLocation
import MapKit.MKPointAnnotation
import SDWebImage

class RecipeDetailViewModel {
    var meal: Meal!
    var mealLocation: CLLocationCoordinate2D! {
        CLLocationCoordinate2D(
            latitude: meal.latitude,
            longitude: meal.longitude)
    }
}

extension RecipeDetailViewModel {
    func getMealAnnotation() -> MKPointAnnotation {
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = self.mealLocation
        annotation1.title = self.meal.strMeal
        annotation1.subtitle = self.meal.strArea
        return annotation1
    }
    
    func configure(_ view: RecipeTitleDetailView) {
        view.titleLabel.text = self.meal.strMeal
        view.foodTypeLabel.text = self.meal.strCategory
        view.foodTagsLabel.text = self.meal.strTags ?? "Not available"
        view.countryOriginLabel.text = "From: \(self.meal.strArea)"
    }
    
    func configureHeaderImageView(_ view: UIImageView) {
        guard let url = URL(string: self.meal.strMealThumb ?? "") else { return }
        view.sd_setImage(with: url)
    }
}
