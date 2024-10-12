//
//  NavigationRouter.swift
//  VkApp
//
//  Created by Mac on 23.09.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import UIKit

class NavigationRouter {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.delegate = self
        
        navigationController.pushViewController(welcomeViewController, animated: true)
    }
}

extension NavigationRouter: WelcomeViewControllerDelegate {
    func userDidRequestStart() {
        let friendListViewController = FriendListViewController()
        navigationController.pushViewController(friendListViewController, animated: true)
    }
}
