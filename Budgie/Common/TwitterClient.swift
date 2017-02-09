//
//  TwitterClient.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import Foundation

class TwitterClient {
  static let shared = TwitterClient()

  var timeLine: [Tweet] = []

  private init() { }

  // Example of method with return success/failure return blocks

  func loadMoreTweets(_ counter: Int, success: ([Tweet]) -> Void, failure: (Error) -> Void) {

    // Here the client should call the Twitter API
    // As there is no dev key available at this time. Fake tweets are generated

    var tweets: [Tweet] = []

    for _ in 0..<counter {
      let index = Int(arc4random_uniform(555)) % 10
      let shareCounter = Double(arc4random_uniform(555))
      let retweetCounter = Double(arc4random_uniform(555))
      let likesCounter = Double(arc4random_uniform(555))
      let isFavorite = arc4random_uniform(5) % 2 == 0 ? true : false
      let isRetweeted = arc4random_uniform(5) % 2 == 0 ? true : false
      let date = Date(timeInterval: Double(arc4random_uniform(260000)), since: Date())
      let tweet: Tweet! = Tweet(k.TweetGenerator.names[index], userHandler: k.TweetGenerator.handlers[index], userPhotoURL: k.TweetGenerator.userPhotoURLs[index], date: date, content: k.TweetGenerator.texts[index], shareCounter: shareCounter, retweetsCounter: retweetCounter, likesCounter: likesCounter, isFavorite: isFavorite, isRetweeted: isRetweeted)
      tweets.append(tweet)
    }

    timeLine = tweets + timeLine

    success(tweets)

  }

  // Exmaple of method posting notification

  func post(_ tweet: Tweet) {

    // Here the client should call the Twitter API
    // As there is no dev key available at this time. No call is made.

    timeLine = [tweet] + timeLine

    NotificationCenter.default.post(k.tweetPostedNotification)

  }

}
