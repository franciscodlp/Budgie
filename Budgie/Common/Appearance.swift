//
//  Appearance.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit

extension UINavigationBar {

  class func setBudgieAppearance() {
    UINavigationBar.appearance().tintColor = .myYellow
    UINavigationBar.appearance().barTintColor = .myBlue
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.myYellow]
    UINavigationBar.appearance().isTranslucent = false
  }
}

extension UITabBar {
  class func setBudgieAppearance() {
    UITabBar.appearance().isTranslucent = false
    UITabBar.appearance().tintColor = .myBlue
  }
}
