//
//  RecentCell.swift
//  best-recipes-ios
//
//  Created by Алексей on 01.07.2024.
//

import UIKit

final class RecentCell: UICollectionViewCell {
    
    /// Выравнивает текст по верхнему краю
    final class CustomTitleLabel: UILabel {
        override func drawText(in rect: CGRect) {
            super.drawText(
                in: .init(
                    origin: .zero,
                    size: textRect(
                        forBounds: rect,
                        limitedToNumberOfLines: numberOfLines
                    ).size
                )
            )
        }
    }
    
    // MARK: - UI
    private lazy var coverImageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFill
        element.clipsToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        element.layer.cornerRadius = 10
        return element
    }()
    
    private lazy var titleLabel: CustomTitleLabel = {
        let element = CustomTitleLabel()
        element.font = UIFont.TextFonts.Home.RecentRecipe.titleCell
        element.textColor = UIColor.Home.title
        element.translatesAutoresizingMaskIntoConstraints = false
        element.numberOfLines = 2
        return element
    }()
    
    private lazy var nameAuthor: UILabel = {
        let element = UILabel()
        element.font = UIFont.TextFonts.Home.RecentRecipe.subtitle
        element.textColor = UIColor.Home.authorName
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Overrides Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        coverImageView.image = nil
        titleLabel.text = nil
        nameAuthor.text = nil
    }
    
    // MARK: - Add subviews
    private func addSubviews() {
        addSubview(coverImageView)
        addSubview(titleLabel)
        addSubview(nameAuthor)
    }
    
    // MARK: - Private methods
    /// Ищет первый пробел в строке и сносит на новый абзац
    private func replaceFirstSpace(in string: String, with character: Character) -> String? {
        if let spaceIndex = string.firstIndex(of: " ") {
            var modifiedString = string
            modifiedString.replaceSubrange(spaceIndex...spaceIndex, with: String(character))
            return modifiedString
        } else {
            return string
        }
    }

    // MARK: - Configure Cell
    func configureCell(item: Item) {
        coverImageView.image = item.coverImage
        titleLabel.text = replaceFirstSpace(in: item.title, with: "\n")
        nameAuthor.text = "By " + item.nameAuthor
    }
}

// MARK: - Setup Constraints
private extension RecentCell {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            coverImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            coverImageView.topAnchor.constraint(equalTo: topAnchor),
            coverImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8),
            
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            titleLabel.bottomAnchor.constraint(equalTo: nameAuthor.topAnchor, constant: -4),
            
            nameAuthor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 3),
            nameAuthor.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            nameAuthor.heightAnchor.constraint(equalToConstant: 14),
            nameAuthor.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}