//
//  UIViewController + Extension.swift
//  best-recipes-ios
//
//  Created by Елена Логинова on 11.07.2024.
//

import UIKit

extension UIViewController {
    
    func setupHomeScreenNavBar(on viewController: UIViewController,
                               with text: String,
                               searchController: UISearchController) {
        
        guard let width = viewController.navigationController?.navigationBar.frame.size.width,
              let height = viewController.navigationController?.navigationBar.frame.size.height  else { return }
        let titleHomeScreen: UILabel = {
            let label = UILabel(frame: CGRectMake(0, 0, width, height))
            label.backgroundColor = .clear
            label.numberOfLines = 0
            label.font = UIFont.PoppinsFont.semibold(size: 24)
            label.textAlignment = .left
            label.textColor = .black
            label.text = text
            return label
        }()
        
        navigationItem.titleView = titleHomeScreen
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        extendedLayoutIncludesOpaqueBars = true
    }
    
    func setupNavBarWithoutButtons(on viewController: UIViewController, with text: String)
        {
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = text
            label.textAlignment = .center
            label.font = UIFont.PoppinsFont.semibold(size: 24)
            return label
        }()
        viewController.navigationItem.titleView = titleLabel
    }

    func setupNavBarWithButtons(on viewController: UIViewController, text: String) {
        
        let shareButton: UIButton = {
            let button = UIButton()
            button.setImage(Icons.moreHorizontal, for: .normal)
            button.addTarget(self, action: #selector(shareButtonPressed), for: .touchUpInside)
            return button
        }()

        let backButton: UIButton = {
            let button = UIButton()
            button.setImage(Icons.arrowLeft, for: .normal)
            button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
            return button
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = text
            label.textAlignment = .center
            label.font = UIFont.PoppinsFont.semibold(size: 24)
            return label
        }()
        
        viewController.navigationItem.titleView = titleLabel
        viewController.navigationItem.setHidesBackButton(true, animated: true)
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: shareButton)
    }
    
    @objc func backButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.45
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
            self.navigationController?.popViewController(animated: true)
       }
    }
    
    @objc func shareButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.45
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
}