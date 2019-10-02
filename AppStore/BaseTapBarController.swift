//
//  BaseTapBarController.swift
//  AppStore
//
//  Created by Aleksandr Avdukich on 03/10/2019.
//  Copyright © 2019 Aleksandr Avdukich. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = "Apps"
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.title = "Apps"
        redNavController.tabBarItem.image = #imageLiteral(resourceName: "apps")
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueViewController = UIViewController()
        blueViewController.view.backgroundColor = .white
        blueViewController.navigationItem.title = "Search"
        let blueNavController = UINavigationController(rootViewController: blueViewController)
        blueNavController.tabBarItem.title = "Search"
        blueNavController.navigationBar.prefersLargeTitles = true
        blueNavController.tabBarItem.image = #imageLiteral(resourceName: "search")
        
//        tabBar.tintColor = .yellow //цвет иконки
//        tabBar.barTintColor = .green //цвет бара
        
        viewControllers = [
            redNavController,
            blueNavController
        ]
        
    }
    
}

