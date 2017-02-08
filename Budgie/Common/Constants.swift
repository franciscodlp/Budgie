//
//  Constants.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit

// swiftlint:disable:next type_name
class k {
  static let homeNIBName = "HomeViewController"
  static let composerNIBName = "ComposeTweetViewController"
  static let tabBarNIBName = "MainTabBarController"

  static let homeNIB = UINib(nibName: k.homeNIBName, bundle: nil)
  static let composerNIB = UINib(nibName: k.composerNIBName, bundle: nil)
  static let tabBarNIB = UINib(nibName: k.tabBarNIBName, bundle: nil)

  static let homeTabBarTitle = "Home"
  static let profileTabBarTitle = "Profile"

  static let homeTabBarIcon = UIImage(named: "")
  static let ProfileTabBarIcon = UIImage(named: "")
}
