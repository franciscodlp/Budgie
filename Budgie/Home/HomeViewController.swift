//
//  HomeViewController.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit
import AlamofireImage

class HomeViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  fileprivate var refresher: UIRefreshControl!
  fileprivate var client: TwitterClient!
  var tweets: [Tweet]!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    NotificationCenter.default.addObserver(self, selector: #selector(loadPostedTweet), name: k.tweetPostedName, object: nil)

    client = TwitterClient.shared

    tableView.delegate = self
    tableView.dataSource = self

    refresher = UIRefreshControl()
    refresher.addTarget(self, action: #selector(fetchTweets), for: .valueChanged)
    tableView.addSubview(refresher)

    let composerButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(onComposerButton))
    navigationItem.rightBarButtonItem = composerButton

    navigationItem.titleView = UIImageView(image: k.budgieTitleImage)

    tableView.register(k.tweetCellNIB, forCellReuseIdentifier: k.tweetCellReuseID)

    fetchTweets()
  }

  func loadPostedTweet() {
    guard let newestTweet = client.timeLine.first else { return }
    tweets = [newestTweet] + tweets
    tableView.beginUpdates()
    tableView.insertRows(at: [IndexPath(row: 0, section:0)], with: .automatic)
    tableView.endUpdates()
  }

  func fetchTweets() {
    let count = 10

    client.loadMoreTweets(count, success: { tweets in
      refresher.endRefreshing()
      self.tweets = tweets + (self.tweets ?? [])
      let indexPaths = (0..<count).map { IndexPath(row: $0, section: 0) }
      tableView.beginUpdates()
      tableView.insertRows(at: indexPaths, with: .automatic)
      tableView.endUpdates()
    }) { error in
      refresher.endRefreshing()
      print(error.localizedDescription)
    }
  }

  func onComposerButton() {
    let composer = ComposerViewController(nibName: k.composerNIBName, bundle: nil)
    self.hidesBottomBarWhenPushed = true
    navigationController?.pushViewController(composer, animated: true)
  }

}

// MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let singleTweetViewController = SingleTweetViewController(nibName: k.singleTweetNIBName, bundle: nil)
    singleTweetViewController.tweet = tweets[indexPath.row]
    singleTweetViewController.indexPath = indexPath
    self.navigationController?.pushViewController(singleTweetViewController, animated: true)
  }
}

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tweets?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: k.tweetCellReuseID, for: indexPath) as? HomeTweetCell else {
      return UITableViewCell()
    }
    cell.delegate = self
    let tweet = tweets[indexPath.row]

    cell.nameLabel.text = tweet.userName ?? "Unknown"
    cell.handlerLabel.text = tweet.userHandler ?? "@..."
    cell.contentLabel.text = tweet.content ?? "..."
    cell.shareCounter = tweet.shareCounter ?? 0.0
    cell.retweetsCounter = tweet.retweetsCounter ?? 0.0
    cell.likesCounter = tweet.likesCounter ?? 0.0
    cell.isFavorite = tweet.isFavorite
    cell.isRetweeted = tweet.isRetweeted

    guard let urlString = tweet.userPhotoURL, let url = URL(string: urlString) else {
      cell.profileImageView.image = k.profilePlaceholder
      return cell
    }

    let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 30.0)
    cell.profileImageView?.af_setImage(withURLRequest: request, placeholderImage: k.profilePlaceholder, filter: nil, progress: nil,
                                       progressQueue: .main, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false,
                                       completion: { response in
                                        cell.profileImageView?.image = response.result.value ?? k.profilePlaceholder
    })
    return cell
  }
}

// MARK: HomeTweetCellDelegate
extension HomeViewController: HomeTweetCellDelegate {

  func onShareButton(in cell: HomeTweetCell) {
    guard let index = tableView.indexPath(for: cell)?.row else { return }
    tweets[index].shareCounter = tweets[index].shareCounter + 1
    // Call method in Twitter Client
  }

  func onRetweetButton(in cell: HomeTweetCell, _ isRetweeted: Bool) {
    guard let index = tableView.indexPath(for: cell)?.row else { return }
    tweets[index].isRetweeted = isRetweeted
    tweets[index].retweetsCounter = tweets[index].retweetsCounter + (isRetweeted ? 1 : -1)
    // Call method in Twitter Client
  }

  func onLikeButton(in cell: HomeTweetCell, _ isFavorite: Bool) {
    guard let index = tableView.indexPath(for: cell)?.row else { return }
    tweets[index].isFavorite = isFavorite
    tweets[index].likesCounter = tweets[index].likesCounter + (isFavorite ? 1 : -1)
    // Call method in Twitter Client
  }
}
