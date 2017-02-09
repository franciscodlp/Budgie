//
//  ComposerViewController.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit

class ComposerViewController: UIViewController {

  @IBOutlet var imageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var handlerLabel: UILabel!
  @IBOutlet var textView: UITextView!

  private var client: TwitterClient!
  private var user: User!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "\(k.maxTweetLength)"

    let tweetButton = UIBarButtonItem(title: "Tweet", style: .plain, target: self, action: #selector(onTweetButton))
    navigationItem.rightBarButtonItem = tweetButton
    navigationItem.rightBarButtonItem?.isEnabled = false

    let backButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onCancelButton))
    navigationItem.leftBarButtonItem = backButton

    textView.delegate = self

    textView.layer.cornerRadius = 4
    textView.layer.borderWidth = 1
    textView.layer.borderColor = UIColor.myBlue.cgColor
    textView.text = k.textViewPlaceholder

    imageView.image = k.userProfilePicture

    client = TwitterClient.shared
    user = User.currentUser
  }

  func onTweetButton() {
    guard let user = user, let content = textView.text, content != "" else { return }

    guard let newTweet = Tweet(user.name, userHandler: user.handler, userPhotoURL: user.profilePictureURL, date: Date(), content: content, shareCounter: 0, retweetsCounter: 0, likesCounter: 0, isFavorite: false, isRetweeted: false) else { return }

    client.post(newTweet)

    dismissViewController()
  }

  func onCancelButton() {
    dismissViewController()
  }

  func dismissViewController() {
    guard let viewControllers = navigationController?.viewControllers else { return }
    guard let index = viewControllers.index(of: self), index > 0 else { return }
    viewControllers[index - 1].hidesBottomBarWhenPushed = false
    let _ = navigationController?.popViewController(animated: true)
  }

}

// MARK: UITextViewDelegate
extension ComposerViewController: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    let diff = 140 - textView.text.characters.count

    guard diff >= 0 else {
      let originalText = textView.text
      let extraCharIndex = textView.text.endIndex
      let endIndex = textView.text.index(extraCharIndex, offsetBy: -1)
      textView.text = originalText?.substring(to: endIndex)

      return
    }
    navigationItem.title = "\(diff)"
    navigationItem.rightBarButtonItem?.isEnabled = diff < 140 ? true : false

  }

  func textViewDidBeginEditing(_ textView: UITextView) {
    guard textView.text != k.textViewPlaceholder else {
      textView.text = nil
      return
    }
    return
  }
}
