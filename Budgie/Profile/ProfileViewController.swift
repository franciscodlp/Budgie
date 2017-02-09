//
//  ProfileViewController.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

  @IBOutlet var imageView: UIImageView!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.layer.borderColor = UIColor.myBlue.cgColor
    imageView.layer.borderWidth = 2
    imageView.layer.cornerRadius = 5
  }

}
