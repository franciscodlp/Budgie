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

  class func getRandomTweets(_ counter: Int) -> [Tweet] {
    var tweets: [Tweet] = []

    for _ in 0..<counter {
      let index = Int(arc4random_uniform(555)) % 10
      let shareCounter = Double(arc4random_uniform(555555))
      let retweetCounter = Double(arc4random_uniform(555555))
      let likesCounter = Double(arc4random_uniform(555555))
      let isFavourited = arc4random_uniform(5) % 2 == 0 ? true : false
      let isRetweeted = arc4random_uniform(5) % 2 == 0 ? true : false
      let date = Date(timeInterval: Double(arc4random_uniform(260000)), since: Date())
      let tweet: Tweet! = Tweet(k.TweetGenerator.names[index], userHandler: k.TweetGenerator.handlers[index], userPhotoURL: k.TweetGenerator.userPhotoURLs[index], userDate: date, content: k.TweetGenerator.texts[index], shareCounter: shareCounter, retweetsCounter: retweetCounter, likesCounter: likesCounter, isFavourited: isFavourited, isRetweeted: isRetweeted)
      tweets.append(tweet)
    }

    return tweets
  }
}
