//
//  IngredientCollectionViewCell.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 21/02/23.
//

import UIKit

class IngredientCollectionViewCell: UICollectionViewCell {
    //MARK: - UI
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var coloredView: UIView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var ingredientNameLabel: UILabel!
    
    //MARK: - Variables
    static let reuseIdentifier = String(describing: IngredientCollectionViewCell.self)
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.parentView.backgroundColor = .black
    }

}
