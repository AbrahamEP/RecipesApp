//
//  MealDetailView.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 22/02/23.
//

import Foundation
import UIKit

enum MealDetailButtonType {
    case ingredients, preparation
}

protocol MealDetailViewDelegate {
    func didPressedButton(of type: MealDetailButtonType, _ view: MealDetailView)
}

class MealDetailView: UIView {
    
    //MARK: - UI
    private let ingredientsButton: UIButton! = {
        let button = UIButton()
        button.setTitle("Ingredients", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let preparationButton: UIButton! = {
        let button = UIButton()
        button.setTitle("Preparation", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let containerView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    private lazy var preparationLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preheat the oven to 180C/350F Gas Mark 4. Grease and line the base of an 8 in round spring form cake tin with baking parchmentrnBreak the chocolate into a heatproof bowl and place over a saucepan of gently simmering water and stir until it melts. (or melt in the microwave for 2-3 mins stirring occasionally)rnPlace the butter and sugar in a mixing bowl and cream together with a wooden spoon until light and fluffy. Gradually beat in the eggs, adding a little flour if the mixture begins to curdle. Fold in the remaining flour with the cooled, melted chocolate and milk. Mix until smooth.rnSpread the mixture into the cake tin and bake for 50-55 mins or until firm in the centre and a skewer comes out cleanly. Cool for 10 minutes, then turn out and cool completely."
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .body, compatibleWith: .current).withSize(14)
        
        return label
    }()
    
    private lazy var ingredientsCollectionView: UICollectionView! = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10.0
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .black
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        let nib = UINib(nibName: IngredientCollectionViewCell.reuseIdentifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: IngredientCollectionViewCell.reuseIdentifier)
        
        return collection
    }()
    
    //MARK: - Variables
    var delegate: MealDetailViewDelegate?
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupViews()
    }
    
    //MARK: - Helper Methods
    private func setupViews() {
        self.setupIngredientsButton()
        self.setupPreparationButton()
        self.setupContainerView()
    }
    
    private func setupIngredientsButton() {
        self.addSubview(self.ingredientsButton)
        
        self.ingredientsButton.addTarget(self, action: #selector(ingredientsButtonAction), for: .touchUpInside)
        
        self.ingredientsButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.ingredientsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    }
    
    private func setupPreparationButton() {
        self.addSubview(self.preparationButton)
        
        self.preparationButton.addTarget(self, action: #selector(preparationButtonAction), for: .touchUpInside)
        
        self.preparationButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.preparationButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setupContainerView() {
        self.addSubview(self.containerView)
        
        self.containerView.topAnchor.constraint(equalTo: self.ingredientsButton.bottomAnchor, constant: 16).isActive = true
        self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func setupIngredientsCollectionView() {
        self.ingredientsCollectionView.dataSource = self
        self.ingredientsCollectionView.delegate = self
        
        self.ingredientsCollectionView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 8).isActive = true
        
        self.ingredientsCollectionView.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8).isActive = true
        
        self.ingredientsCollectionView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16).isActive = true
        
        self.ingredientsCollectionView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    private func setupPreparationLabel() {
        self.preparationLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 8).isActive = true
        
        self.preparationLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -8).isActive = true
        
        self.preparationLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 16).isActive = true
        
        self.preparationLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -16).isActive = true
    }
    
    //MARK: - Button Actions
    @IBAction func ingredientsButtonAction() {
        _ = self.containerView.subviews.map { $0.removeFromSuperview() }
        self.containerView.addSubview(self.ingredientsCollectionView)
        self.setupIngredientsCollectionView()
        
        self.delegate?.didPressedButton(of: .ingredients, self)
    }
    
    @IBAction func preparationButtonAction() {
        _ = self.containerView.subviews.map { $0.removeFromSuperview() }
        self.containerView.addSubview(self.preparationLabel)
        self.setupPreparationLabel()
        
        self.delegate?.didPressedButton(of: .preparation, self)
    }
}

extension MealDetailView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IngredientCollectionViewCell.reuseIdentifier, for: indexPath) as! IngredientCollectionViewCell
        
        
        return cell
    }
}

extension MealDetailView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (self.containerView.frame.height / 2) - 32
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        let width = (self.containerView.frame.height / 2) - 32
        return UIEdgeInsets(top: width, left: 16, bottom: width, right: 16)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }
}
