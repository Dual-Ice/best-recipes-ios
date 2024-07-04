//
//  HeaderTableView.swift
//  best-recipes-ios
//
//  Created by Елена Логинова on 04.07.2024.
//

import UIKit

final class HeaderTableView: UITableViewHeaderFooterView {

    static let identifier = "HeaderTableView"
    
    private let titleLabel: UILabel = {
        let label = LabelFactory.createInstructionsLabel(text: "Title")
        return label
    }()
    
    private let countIngredientLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .lightGray
        label.font = UIFont.TextFonts.RecipeDetail.countIngredients
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(countIngredientLabel)
    }
    
    public func configureHeader(categoryName: String, countIngredient: String) {
        self.titleLabel.text = categoryName
        self.countIngredientLabel.text = countIngredient
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            countIngredientLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            countIngredientLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            countIngredientLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            countIngredientLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }

}