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

    let profileViewController = UIViewController()
    profileViewController.title = k.profileTabBarTitle
    profileViewController.view.backgroundColor = .green

    self.viewControllers = [homeNavigationController, profileViewController]

  }

}
