//
//  RecipeTitleDetailView.swift
//  RecipesApp
//
//  Created by Abraham Escamilla Pinelo on 22/02/23.
//

import UIKit

protocol RecipeTitleDetailViewDelegate {
    func didPressMapButton(_ view: RecipeTitleDetailView)
}

class RecipeTitleDetailView: UIView {
    
    //MARK: - UI
    let titleLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Focaccia Break"
        label.font = .preferredFont(forTextStyle: .title1)
        label.setContentHuggingPriority(.init(rawValue: 249.0), for: .horizontal)
        label.setContentHuggingPriority(.init(rawValue: 251.0), for: .vertical)
        label.setContentCompressionResistancePriority(.init(rawValue: 751.0), for: .horizontal)
        label.adjustsFontSizeToFitWidth = true
        
        return label
    }()
    let countryOriginLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "From: France"
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.setContentHuggingPriority(.init(rawValue: 251.0), for: .horizontal)
        label.setContentHuggingPriority(.init(rawValue: 251.0), for: .vertical)
        
        
        return label
    }()
    let foodTypeLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dessert"
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.setContentHuggingPriority(.init(rawValue: 251.0), for: .horizontal)
        label.setContentHuggingPriority(.init(rawValue: 251.0), for: .vertical)
        
        
        return label
    }()
    let foodTagsLabel: UILabel! = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tart, Baking, Alcoholic"
        label.font = .preferredFont(forTextStyle: .caption1)
        
        return label
    }()
    let favoriteButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.isHidden = true
        
        return button
    }()
    let shareButton: UIButton! = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "mappin.circle.fill"), for: .normal)
        
        return button
    }()
    
    //MARK: - Variables
    var delegate: RecipeTitleDetailViewDelegate?
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setupViews()
    }
    
    //MARK: - Helper methods
    private func setupViews() {
        
        self.setupShareButton()
        self.setupTitleLabel()
        self.setupCountryLabel()
        self.setupFoodTypeLabel()
        self.setupTagsLabel()
        self.setupFavoriteButton()
    }
    
    private func setupCountryLabel() {
        self.addSubview(self.countryOriginLabel)
        
        self.countryOriginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.countryOriginLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8).isActive = true
    }
    
    private func setupFoodTypeLabel() {
        self.addSubview(self.foodTypeLabel)
        
        self.foodTypeLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8).isActive = true
        self.foodTypeLabel.leadingAnchor.constraint(equalTo: self.countryOriginLabel.trailingAnchor, constant: 40).isActive = true
    }
    
    private func setupTagsLabel() {
        self.addSubview(self.foodTagsLabel)
        
        self.foodTagsLabel.topAnchor.constraint(equalTo: self.countryOriginLabel.bottomAnchor, constant: 20).isActive = true
        self.foodTagsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
    }
    
    private func setupFavoriteButton() {
        self.addSubview(self.favoriteButton)
        
        self.favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
        self.favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.favoriteButton.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: 8).isActive = true
        self.favoriteButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupShareButton() {
        self.addSubview(self.shareButton)
        
        self.shareButton.addTarget(self, action: #selector(shareButtonAction), for: .touchUpInside)
        self.shareButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        self.shareButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.shareButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.shareButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setupTitleLabel() {
        self.addSubview(self.titleLabel)
        
        self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.shareButton.leadingAnchor, constant: 16).isActive = true
    }
    
    //MARK: - Button Actions
    @IBAction private func favoriteButtonAction() {
        print("Favorite button pressed")
    }
    
    @IBAction private func shareButtonAction() {
        self.delegate?.didPressMapButton(self)
    }
}
