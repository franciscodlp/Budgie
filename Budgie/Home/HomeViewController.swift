//
//  HomeViewController.swift
//  Budgie
//
//  Created by Francisco de la Pena on 2/8/17.
//  Copyright © 2017 Twister Labs. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet var tableView: UITableView!
  fileprivate var refresher: UIRefreshControl!

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    tableView.delegate = self
    tableView.dataSource = self

    refresher = UIRefreshControl()
    refresher.addTarget(self, action: #selector(fetchNewTweets), for: .valueChanged)
    tableView.addSubview(refresher)

    let composerButton = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(onComposerButton))
    navigationItem.rightBarButtonItem = composerButton
  }

  func fetchNewTweets() {
    refresher.endRefreshing()
  }

  func onComposerButton() {

  }

}

extension HomeViewController {

}

// MARK: UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

}

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell()
    return cell
  }
}
