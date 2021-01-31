//
//  MainCoordinator.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

final class MainCoordinator : BaseCoordinator {
    private let window: UIWindow?
    let navigationController : UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    override func start() {
        setUpHomeList()
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
    
    private func setUpHomeList() {
        let homeListViewController = HomeListViewController()
        let homeListViewModel = HomeListViewModel(services: HomeListServices())
        homeListViewController.viewModel = homeListViewModel
        navigationController.pushViewController(homeListViewController, animated: true)
    }
}
