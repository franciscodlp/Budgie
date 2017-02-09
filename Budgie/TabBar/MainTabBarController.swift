//
//  MainTabBarController.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()

    let homeViewController = HomeViewController(nibName: k.homeNIBName, bundle: nil)
    homeViewController.view.backgroundColor = .blue
    homeViewController.title = k.homeTabBarTitle

    let homeNavigationController = UINavigationController(rootViewController: homeViewController)
    homeNavigationController.tabBarItem.image = k.homeTabBarIcon

    let profileViewController = ProfileViewController(nibName: k.profileNIBName, bundle: nil)
    profileViewController.tabBarItem.image = k.profileTabBarIcon
    profileViewController.title = k.profileTabBarTitle

    self.viewControllers = [homeNavigationController, profileViewController]
  }

}
