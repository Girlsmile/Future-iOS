//
//  ViewController.swift
//  二叉树
//
//  Created by 古智鹏 on 2020/10/4.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.view.addSubview(tableView)
        tableView.frame = view.frame
//        tableView.addConstraint(NSLayoutConstraint.init(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: <#T##CGFloat#>))
//        // Do any additional setup after loading the view.
    }


}

