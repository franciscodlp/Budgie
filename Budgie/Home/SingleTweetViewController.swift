//
//  SingleTweetViewController.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/9/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit
import AlamofireImage

class SingleTweetViewController: UIViewController {

  var tweet: Tweet!
  var indexPath: IndexPath!

  @IBOutlet var coverImageView: UIImageView!
  @IBOutlet var profileImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var handlerLabel: UILabel!
  @IBOutlet var contentLabel: UILabel!

  @IBOutlet var shareButton: UIButton!
  @IBOutlet var retweetButton: UIButton!
  @IBOutlet var likeButton: UIButton!

  private var name: String!
  private var handler: String!
  private var profileImageURL: String!
  private var content: String!
  private var shareCounter: Double!
  private var retweetsCounter: Double!
  private var likesCounter: Double!
  private var isFavorite: Bool!
  private var isRetweeted: Bool!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    coverImageView.image = k.coverImage
    coverImageView.contentMode = .scaleAspectFill
    coverImageView.clipsToBounds = true

    profileImageView.layer.borderWidth = 3
    profileImageView.layer.borderColor = UIColor.white.cgColor
    profileImageView.layer.cornerRadius = 5
    profileImageView.clipsToBounds = true

    guard let tweet = tweet else { return }
    name = tweet.userName ?? "Unknown"
    handler = tweet.userHandler ?? "Unknown"
    profileImageURL = tweet.userPhotoURL ?? ""
    content = tweet.content ?? "..."
    shareCounter = tweet.shareCounter ?? 0.0
    retweetsCounter = tweet.retweetsCounter ?? 0.0
    likesCounter = tweet.likesCounter ?? 0.0
    isFavorite = tweet.isFavorite ?? false
    isRetweeted = tweet.isRetweeted ?? false

    nameLabel.text = name
    handlerLabel.text = handler
    contentLabel.text = content

    shareButton.setImage(k.shareIcon, for: .normal)
    shareButton.setTitle(String(format: "%.0f", shareCounter), for: .normal)

    retweetButton.setImage(isRetweeted! ? k.retweetIconSelected : k.retweetIcon, for: .normal)
    retweetButton.setTitle(String(format: "%.0f", retweetsCounter), for: .normal)

    likeButton.setImage(isFavorite! ? k.likeIconSelected : k.likeIconSolid, for: .normal)
    likeButton.setTitle(String(format: "%.0f", likesCounter), for: .normal)

    guard let url = URL(string: profileImageURL) else { return }

    profileImageView.af_setImage(withURL: url, placeholderImage: k.profilePlaceholder, filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false) { response in
      self.profileImageView?.image = response.result.value ?? k.profilePlaceholder
    }
    let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(onBack))
    navigationItem.leftBarButtonItem = backButton
  }

  func onBack() {
    defer {
      let _ = navigationController?.popViewController(animated: true)
    }
    guard let callerViewController = navigationController?.viewControllers[0] as? HomeViewController else { return }
    callerViewController.tweets[indexPath.row].shareCounter = shareCounter
    callerViewController.tweets[indexPath.row].retweetsCounter = retweetsCounter
    callerViewController.tweets[indexPath.row].likesCounter = likesCounter
    callerViewController.tweets[indexPath.row].isRetweeted = isRetweeted
    callerViewController.tweets[indexPath.row].isFavorite = isFavorite
    callerViewController.tableView.reloadRows(at: [indexPath], with: .none)
  }

  @IBAction func onShareButton(_ sender: UIButton) {
    defer {
      shareCounter! += 1.0
    }
    guard let counterString = shareButton.titleLabel?.text else {
      shareButton.setTitle("1", for: .normal)
      return
    }

    shareButton.setTitle(String(format: "%.0f", Double(counterString)! + 1), for: .normal)
    return
  }

  @IBAction func onRetweetButton(_ sender: UIButton) {
    defer {
      isRetweeted = !isRetweeted
      // swiftlint:disable:next shorthand_operator
      retweetsCounter = retweetsCounter + (isRetweeted! ? 1 : -1)
    }

    guard let counterString = retweetButton.titleLabel?.text else {
      retweetButton.setTitle("1", for: .normal)
      retweetButton.setImage(k.retweetIconSelected, for: .normal)
      return
    }

    if isRetweeted! {
      retweetButton.setTitle(String(format: "%.0f", Double(counterString)! - 1), for: .normal)
      retweetButton.setImage(k.retweetIcon, for: .normal)
    } else {
      retweetButton.setTitle(String(format: "%.0f", Double(counterString)! + 1), for: .normal)
      retweetButton.setImage(k.retweetIconSelected, for: .normal)
    }

    return
  }

  @IBAction func onLikeButton(_ sender: UIButton) {
    defer {
      isFavorite = !isFavorite
      // swiftlint:disable:next shorthand_operator
      likesCounter = likesCounter + (isFavorite! ? 1 : -1)
    }

    guard let counterString = likeButton.titleLabel?.text else {
      likeButton.setTitle("1", for: .normal)
      likeButton.setImage(k.likeIconSelected, for: .normal)
      return
    }

    if isFavorite! {
      likeButton.setTitle(String(format: "%.0f", Double(counterString)! - 1), for: .normal)
      likeButton.setImage(k.likeIconSolid, for: .normal)
    } else {
      likeButton.setTitle(String(format: "%.0f", Double(counterString)! + 1), for: .normal)
      likeButton.setImage(k.likeIconSelected, for: .normal)
    }

    return
  }
}
