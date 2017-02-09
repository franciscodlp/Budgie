//
//  Tweet.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import Foundation

class Tweet {

  var userName: String!
  var userHandler: String!
  var userPhotoURL: String!
  var date: Date!
  var content: String!
  var shareCounter: Double!
  var retweetsCounter: Double!
  var likesCounter: Double!
  var liked: Bool!
  var retweeted: Bool!

  convenience init?(_ userName: String?, userHandler: String?, userPhotoURL: String?, date: Date?, content: String?, shareCounter: Double?,
                    retweetsCounter: Double?, likesCounter: Double?, liked: Bool?, retweeted: Bool?) {
    self.init()
    guard let userName = userName,
      let userHandler = userHandler,
      let userPhotoURL = userPhotoURL,
      let date = date,
      let content = content,
      let shareCounter = shareCounter,
      let retweetsCounter = retweetsCounter,
      let likesCounter = likesCounter,
      let liked = liked,
      let retweeted = retweeted else { return nil }

    self.userName = userName
    self.userHandler = userHandler
    self.userPhotoURL = userPhotoURL
    self.date = date
    self.content = content
    self.shareCounter = shareCounter
    self.retweetsCounter = retweetsCounter
    self.likesCounter = likesCounter
    self.liked = liked
    self.retweeted = retweeted
  }

}
