//
//  User.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import Foundation

class User {

  static let currentUser = User()

  let name: String? = "Francisco de la Pena"
  let handler: String? = "@franontherocks"
  let profilePictureURL = "https://pbs.twimg.com/profile_images/642002415193952256/McvJ48wV.png"

  private init() { }

}
