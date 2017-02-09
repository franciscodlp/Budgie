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
  func onRetweetButton(in cell: HomeTweetCell, _ isRetweeted: Bool)
  func onLikeButton(in cell: HomeTweetCell, _ isFavorite: Bool)
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

  var isRetweeted: Bool! = false {
    didSet {
      let image = isRetweeted! ? k.retweetIconSelected : k.retweetIcon
      retweetButton.setImage(image, for: .normal)
    }
  }
  var isFavorite: Bool! = false {
    didSet {
      let image = isFavorite! ? k.likeIconSelected : k.likeIconSolid
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
      isRetweeted = !isRetweeted
      delegate?.onRetweetButton(in: self, isRetweeted)
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
      delegate?.onLikeButton(in: self, isFavorite)
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

  weak var delegate: HomeTweetCellDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
    self.selectionStyle = .none
    profileImageView.clipsToBounds = true
    profileImageView.contentMode = .scaleAspectFill

  }

}
