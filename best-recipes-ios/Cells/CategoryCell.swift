//
//  CategoryCell.swift
//  best-recipes-ios
//
//  Created by Алексей on 01.07.2024.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
    
    // MARK: - UI
    private lazy var title: UILabel = {
        let element = UILabel()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.font = UIFont.PoppinsFont.semibold(size: 12)
        element.textColor = UIColor.Home.PopularCategory.cellUnselectedTitle
        element.textAlignment = .center
        return element
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 10
        addSubview(title)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = UIColor.Home.PopularCategory.cellSelectedBackground
                title.textColor = UIColor.Home.PopularCategory.cellSelectedTitle
            } else {
                backgroundColor = UIColor.Home.PopularCategory.cellUnselectedBackground
                title.textColor = UIColor.Home.PopularCategory.cellUnselectedTitle
            }
        }
    }
    
    func configureCell(title: String?) {
        self.title.text = title
    }
}


// MARK: - Setup Constraints
private extension CategoryCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
