//
//  Tweet.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import Foundation

class Tweet {
  var userName: String?
  var userHandler: String?
  var userPhotoURL: String?
  var userDate: Date?
  var content: String?
  var shareCounter: Double?
  var retweetsCounter: Double?
  var likesCounter: Double?
  var isFavourited: Bool?
  var isRetweeted: Bool?

  convenience init?(_ userName: String?, userHandler: String?, userPhotoURL: String?, userDate: Date?, content: String?, shareCounter: Double?, retweetsCounter: Double?, likesCounter: Double?, isFavourited: Bool?, isRetweeted: Bool?) {
    self.init()
    guard let userName = userName,
      let userHandler = userHandler,
      let userPhotoURL = userPhotoURL,
      let userDate = userDate,
      let content = content,
      let shareCounter = shareCounter,
      let retweetsCounter = retweetsCounter,
      let likesCounter = likesCounter,
      let isFavourited = isFavourited,
      let isRetweeted = isRetweeted else { return nil }

    self.userName = userName
    self.userHandler = userHandler
    self.userPhotoURL = userPhotoURL
    self.userDate = userDate
    self.content = content
    self.shareCounter = shareCounter
    self.retweetsCounter = retweetsCounter
    self.likesCounter = likesCounter
    self.isFavourited = isFavourited
    self.isRetweeted = isRetweeted
  }

}
