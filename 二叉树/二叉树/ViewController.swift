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
        
//        // Do any additional setup after loading the view.
    }


}

