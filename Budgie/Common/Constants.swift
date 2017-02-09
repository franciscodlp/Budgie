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
  static let composerNIBName = "ComposerViewController"
  static let tabBarNIBName = "MainTabBarController"
  static let profileNIBName = "ProfileViewController"
  static let singleTweetNIBName = "SingleTweetViewController"
  static let tweetCellNIBName = "HomeTweetCell"
  static let tweetCellReuseID = "HomeTweet"

  static let homeNIB = UINib(nibName: k.homeNIBName, bundle: nil)
  static let composerNIB = UINib(nibName: k.composerNIBName, bundle: nil)
  static let tabBarNIB = UINib(nibName: k.tabBarNIBName, bundle: nil)
  static let profileNIB = UINib(nibName: k.profileNIBName, bundle: nil)
  static let singleTweetNIB = UINib(nibName: k.singleTweetNIBName, bundle: nil)
  static let tweetCellNIB = UINib(nibName: k.tweetCellNIBName, bundle: nil)

  static let homeTabBarTitle = "Home"
  static let profileTabBarTitle = "Profile"

  static let budgieImage = UIImage(named: "Budgie")
  static let budgieTitleImage = UIImage(named: "BudgieTitle")
  static let homeTabBarIcon = UIImage(named: "HomeIcon")
  static let profileTabBarIcon = UIImage(named: "ProfileIcon")

  static let userProfilePicture = UIImage(named: "UserProfilePicture")
  static let profilePlaceholder = UIImage(named: "ProfilePlaceholder")
  static let retweetIcon = UIImage(named: "RetweetIcon")
  static let retweetIconSelected = UIImage(named: "RetweetIconSelected")
  static let likeIconSolid = UIImage(named: "LikeIconSolid")
  static let likeIconSelected = UIImage(named: "LikeIconSelected")
  static let shareIcon = UIImage(named: "ShareIcon")
  static let coverImage = UIImage(named: "CoverImage")

  static let maxTweetLength = 140

  static let textViewPlaceholder = "What's in your mind today?"

}

extension k {

  struct TweetGenerator {

    static let names = ["Sam Altman", "Francisco de la Pena", "NatashaTheRobot", "Product Hunt", "CodePath", "Amazon Web Services",
                        "Karl the Fog", "Entrepreneur", "Red Bull", "Mike Butcher"]

    static let handlers = ["@sama", "@franontherocks", "@NatashaTheRobot", "@ProductHunt", "@CodePath", "@AWS",
                           "@KarlTheFog", "@Entrepreneur", "@redbull", "@mikebutcher"]

    static let userPhotoURLs = ["https://pbs.twimg.com/profile_images/804990434455887872/BG0Xh7Oa.jpg",
                                "https://pbs.twimg.com/profile_images/642002415193952256/McvJ48wV.png",
                                "https://pbs.twimg.com/profile_images/651240724004864001/OFRHu0o9.jpg",
                                "https://pbs.twimg.com/profile_images/828503123714985984/s76aEYAl.jpg",
                                "https://pbs.twimg.com/profile_images/434966795993116672/PunLJDfP.png",
                                "https://pbs.twimg.com/profile_images/823577854302502913/ZxYzFqbw.jpg",
                                "https://pbs.twimg.com/profile_images/418790063422459904/_Jvx0ChZ.jpeg",
                                "https://pbs.twimg.com/profile_images/474753665970868224/GcoCzmcI.jpeg",
                                "https://pbs.twimg.com/profile_images/626481857161375748/OeXi9avz.png",
                                "https://pbs.twimg.com/profile_images/668390067094888448/w18aCM4M.jpg"]

    static let texts = ["Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit.",
                        "Quisque tempor tortor turpis, eget viverra velit tincidunt sed.",
                        "Sed ut perspiciatis unde omnis iste natus error",
                        "sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque",
                        "ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta",
                        "sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit",
                        "aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
                        "porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius",
                        "incidunt ut labore et dolore magnam",
                        "aliquam quaerat voluptatem. Ut enim ad minima veniam, quis"]
  }

}

extension k {

  static let newTweetsAvailableName = Notification.Name("io.twisterlabs.newTweetsAvailableName")
  static let tweetPostedName = Notification.Name("io.twisterlabs.tweetPosted")

  static let newTweetsAvailableNotification = Notification(name: k.newTweetsAvailableName)
  static let tweetPostedNotification = Notification(name: k.tweetPostedName)

}
