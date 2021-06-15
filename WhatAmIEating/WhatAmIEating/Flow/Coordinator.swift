//
//  Coordinator.swift
//  WhatAmIEating
//
//  Created by Peterses on 11/04/2021.
//

import UIKit

// MARK: - Coordinator
protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

