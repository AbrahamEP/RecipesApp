//
//  Meal.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 23/02/23.
//

import Foundation

struct Meal: Decodable {
    var idMeal: String
    var strMeal: String
    var strDrinkAlternate: String?
    var strCategory: String
    var strArea: String
    var strInstructions: String
    var strMealThumb: String?
    var strTags: String?
    var strYoutube: String?
    //Ingredients
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    //Measures
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    //Source
    var strSource: String?
    //Location
    var latitude: Double
    var longitude: Double
}
