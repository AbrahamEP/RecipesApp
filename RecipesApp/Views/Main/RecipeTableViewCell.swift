//
//  RecipeTableViewCell.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 21/02/23.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    //MARK: - UI
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var mealTypeLabel: UILabel!
    @IBOutlet weak var originCountryLabel: UILabel!
    
    //MARK: - Variables
    static let reuseIdentifier = String(describing: RecipeTableViewCell.self)

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
