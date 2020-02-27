//
//  GameViewController.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/25.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "游戏"
        
        self.view.addSubview(table)
        self.view.addSubview(collView)
    }
    
    
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotCell") as? HotGameCell
        cell?.updateData(name: "王者荣耀", detail: "5V5公平竞争游戏")
        if indexPath.row == 3 {
            cell?.updateData(name: "吃鸡", detail: "100人逃生游戏", isDownload: true)
        }
        cell?.btnGetBlock = { (button) in
            print(button)
        }
        return cell!
    }
    
    private lazy var table : UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: SCREENWIDTH, height: 370), style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HotGameCell.self, forCellReuseIdentifier: "hotCell")
        tableView.rowHeight = 60
        return tableView
    }()
    
    private lazy var collView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: SCREENWIDTH - CGFloat(40), height: 170)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let coll = UICollectionView.init(frame: CGRect(x: 0, y: 370, width: SCREENWIDTH, height: SCREENHEIGHT - 375.0 - CGFloat(TAB_BAR_HEIGHT) - CGFloat(NAVIGATION_BAR_HEIGHT)), collectionViewLayout: layout)
        coll.backgroundColor = .white
        coll.register(RecommendCollCell.self, forCellWithReuseIdentifier: RecommendCollCell.description())
        coll.delegate = self
        coll.dataSource = self
        coll.contentInset = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
        return coll
    }()
}

extension GameViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollCell.description(), for: indexPath) as? RecommendCollCell
        cell?.updateData()
        return cell!
    }
}

