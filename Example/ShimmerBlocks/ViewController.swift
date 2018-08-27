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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 130
        tableView.registerCellNib(cellClass: InfoTableViewCell.self)
        tableView.refreshControl = UIRefreshControl()
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: InfoTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.isLoading(true)
        return cell
    }

}

extension ViewController: UITableViewDelegate {


}
