//
//  RecipeDetailViewController.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 21/02/23.
//

import Foundation
import UIKit

class RecipeDetailViewController: UIViewController {
    //MARK: - UI
    private let parentView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let scrollView: UIScrollView! = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    private let headerImageView: UIImageView! = {
        let exampleImage = UIImage(named: "MealExample")
        let imageView = UIImageView(image: exampleImage!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let titleDetailView: RecipeTitleDetailView! = {
        let view = RecipeTitleDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let mealDetailView: MealDetailView! = {
        let view = MealDetailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - Variables
    static let identifier = String(describing: RecipeDetailViewController.self)
    
    var meal: Meal!
    var recipeDetailViewModel = RecipeDetailViewModel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupViews()
        self.setupRecipeDetailViewModel()
    }
    
    //MARK: - Helper methods
    private func setupViews() {
        self.view.backgroundColor = .black
        self.setupScrollView()
        self.setupParentView()
        self.setupHeaderImageView()
        self.setupRecipeTitleView()
        self.setupMealDetailView()
    }
    
    private func setupRecipeDetailViewModel() {
        self.recipeDetailViewModel.meal = self.meal
        self.recipeDetailViewModel.configure(self.titleDetailView)
        self.recipeDetailViewModel.configureHeaderImageView(self.headerImageView)
    }
    
    private func setupScrollView() {
        self.view.addSubview(self.scrollView)
        let margins = self.view.layoutMarginsGuide
        
        self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.scrollView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }
    
    private func setupParentView() {
        self.scrollView.addSubview(self.parentView)
        
        let topAnchorConstraint =
        self.parentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        
        let bottomAnchorConstraint = self.parentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        
        let leadingAnchorConstraint = self.parentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
        
        let trailingAnchorConstraint = self.parentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        
        let widthAnchorConstraint = self.parentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
        
        let heightAnchorConstraint = self.parentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        heightAnchorConstraint.priority = UILayoutPriority(250.0)
        
        NSLayoutConstraint.activate([topAnchorConstraint, bottomAnchorConstraint, leadingAnchorConstraint, trailingAnchorConstraint, widthAnchorConstraint, heightAnchorConstraint])
    }
    
    private func setupHeaderImageView() {
        self.parentView.addSubview(self.headerImageView)
        
        self.headerImageView.topAnchor.constraint(equalTo: self.parentView.topAnchor).isActive = true
        self.headerImageView.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor).isActive = true
        self.headerImageView.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor).isActive = true
        self.headerImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    private func setupRecipeTitleView() {
        self.parentView.addSubview(self.titleDetailView)
        
        self.titleDetailView.delegate = self
        
        self.titleDetailView.topAnchor.constraint(equalTo: self.headerImageView.bottomAnchor, constant: 16).isActive = true
        self.titleDetailView.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor, constant: 16).isActive = true
        self.titleDetailView.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor, constant: -16).isActive = true
        self.titleDetailView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    private func setupMealDetailView() {
        self.parentView.addSubview(self.mealDetailView)
        
        self.mealDetailView.delegate = self
        
        self.mealDetailView.topAnchor.constraint(equalTo: self.titleDetailView.bottomAnchor, constant: 16).isActive = true
        
        self.mealDetailView.leadingAnchor.constraint(equalTo: self.parentView.leadingAnchor).isActive = true
        
        self.mealDetailView.trailingAnchor.constraint(equalTo: self.parentView.trailingAnchor).isActive = true
        
        self.mealDetailView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
}

extension RecipeDetailViewController: MealDetailViewDelegate {
    func didPressedButton(of type: MealDetailButtonType, _ view: MealDetailView) {
        print("Button pressed \(type)")
    }
}

extension RecipeDetailViewController: RecipeTitleDetailViewDelegate {
    func didPressMapButton(_ view: RecipeTitleDetailView) {
        let mapVC = MapViewController()
        let recipeViewModel = RecipeDetailViewModel()
        recipeViewModel.meal = self.meal
        mapVC.recipeDetailViewModel = recipeViewModel
        self.navigationController?.show(mapVC, sender: self)
    }
}
