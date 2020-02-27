//
//  HomeViewController.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/23.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(table)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todayCell", for: indexPath) as? ToadyCell
        cell?.updateData(name: "大吉大利，今晚吃鸡")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    private lazy var hometitleView : HomeTitleView = {
        let home = HomeTitleView.init(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 80))
        home.updateData(time: "1999-21", name: "明天")
        return home
    }()
    
    private lazy var table : UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT - CGFloat(STATUS_BAR_HEIGHT)), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.tableHeaderView = self.hometitleView
        tableView.register(ToadyCell.self, forCellReuseIdentifier: "todayCell")
        tableView.rowHeight = 200
        return tableView
    }()
}
