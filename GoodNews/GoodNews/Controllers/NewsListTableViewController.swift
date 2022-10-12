//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by 홍성범 on 2022/10/12.
//

import UIKit

class NewsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
