//
//  ENumbersListCoordinator.swift
//  WhatAmIEating
//
//  Created by Peterses on 12/04/2021.
//

import UIKit

// MARK: - ENumbersListCoordinator
class ENumbersListCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.start()
    }
    
    func start() {
        
        var additives: [Additive] = []
        DbManager.shared.fetchAllAdditives { results in
            for i in 0...results!.count - 1 {
                additives.append(results![i])
            }
        }
        
        let vc = ENumbersListVC(additives: additives)
        vc.tabBarItem = UITabBarItem(title: "Symbole E", image: UIImage(systemName: "text.book.closed"), selectedImage: UIImage(systemName: "text.book.closed.fill"))
        vc.title = "Baza symboli"
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(vc, animated: false)
    }
    
}
