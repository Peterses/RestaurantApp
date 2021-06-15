//
//  HomeCoordinator.swift
//  WhatAmIEating
//
//  Created by Peterses on 12/04/2021.
//

import UIKit

// MARK: - HomeCoordinator
class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.start()
    }
    
    func start() {
        let vc = MainViewController()
        vc.title = "What Am I Eating?"
        vc.tabBarItem = UITabBarItem(title: "Główna", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(vc, animated: false)
    }
    
}
