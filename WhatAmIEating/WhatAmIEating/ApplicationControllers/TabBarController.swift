//
//  TabBarController.swift
//  WhatAmIEating
//
//  Created by Peterses on 11/04/2021.
//

import UIKit

class TabBarVC: UITabBarController {

    let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
    let secondCoordinator = ENumbersListCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([homeCoordinator.navigationController, secondCoordinator.navigationController], animated: false)
        tabBar.tintColor = .systemBlue
    }

}
