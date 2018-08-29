//
//  ViewController.swift
//  ShimmerBlocks
//
//  Created by jgsamudio on 08/07/2018.
//  Copyright (c) 2018 jgsamudio. All rights reserved.
//

import UIKit
import DevKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    private var isLoading = false
    private var networkTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 130
        tableView.registerCellNib(cellClass: InfoTableViewCell.self)

        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshControlUpdated), for: .valueChanged)
    }

    @objc func refreshControlUpdated(_ sender: Any) {
        guard let refreshControl = sender as? UIRefreshControl else {
            return
        }
        isLoading = refreshControl.isRefreshing
        tableView.reloadData()

        if refreshControl.isRefreshing {
            simulateNetworkCall()
        }
    }

    private func simulateNetworkCall() {
        networkTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { [weak self] (_) in
            if let refreshControl = self?.tableView.refreshControl {
                refreshControl.endRefreshing()
                self?.refreshControlUpdated(refreshControl)
            }
        })
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: InfoTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.isLoading(isLoading)
        return cell
    }

}
