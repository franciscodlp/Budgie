//
//  HomeTweetCell.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit

protocol HomeTweetCellDelegate: class {
  func onShareButton(in cell: HomeTweetCell)
  func onRetweetButton(in cell: HomeTweetCell, _ retweeted: Bool)
  func onLikeButton(in cell: HomeTweetCell, _ liked: Bool)
}

class HomeTweetCell: UITableViewCell {

  @IBOutlet var profileImageView: UIImageView!
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var handlerLabel: UILabel!
  @IBOutlet var dateLabel: UILabel!
  @IBOutlet var contentLabel: UILabel!
  @IBOutlet var shareButton: UIButton!
  @IBOutlet var retweetButton: UIButton!
  @IBOutlet var likeButton: UIButton!

  var shareCounter: Double! = 0.0 {
    didSet {
      shareButton.setTitle(String(format: "%.0f", shareCounter), for: .normal)
    }
  }

  var retweetsCounter: Double! = 0.0 {
    didSet {
      retweetButton.setTitle(String(format: "%.0f", retweetsCounter), for: .normal)
    }
  }

  var likesCounter: Double! = 0.0 {
    didSet {
      likeButton.setTitle(String(format: "%.0f", likesCounter), for: .normal)
    }
  }

  var retweeted: Bool! = false {
    didSet {
      let image = retweeted! ? k.retweetIconSelected : k.retweetIcon
      retweetButton.setImage(image, for: .normal)
    }
  }
  var liked: Bool! = false {
    didSet {
      let image = liked! ? k.likeIconSelected : k.likeIconSolid
      likeButton.setImage(image, for: .normal)
    }
  }

  @IBAction func onShareButton(_ sender: UIButton) {
    defer {
      delegate?.onShareButton(in: self)
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
      retweeted = !retweeted
      delegate?.onRetweetButton(in: self, retweeted)
    }

    guard let counterString = retweetButton.titleLabel?.text else {
      retweetButton.setTitle("1", for: .normal)
      retweetButton.setImage(k.retweetIconSelected, for: .normal)
      return
    }

    if retweeted! {
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
      liked = !liked
      delegate?.onLikeButton(in: self, liked)
    }

    guard let counterString = likeButton.titleLabel?.text else {
      likeButton.setTitle("1", for: .normal)
      likeButton.setImage(k.likeIconSelected, for: .normal)
      return
    }

    if liked! {
      likeButton.setTitle(String(format: "%.0f", Double(counterString)! - 1), for: .normal)
      likeButton.setImage(k.likeIconSolid, for: .normal)
    } else {
      likeButton.setTitle(String(format: "%.0f", Double(counterString)! + 1), for: .normal)
      likeButton.setImage(k.likeIconSelected, for: .normal)
    }

    return
  }

  weak var delegate: HomeTweetCellDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
    self.selectionStyle = .none
    profileImageView.clipsToBounds = true
    profileImageView.contentMode = .scaleAspectFill

  }

}
