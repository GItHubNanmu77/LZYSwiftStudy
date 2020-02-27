
//
//  RecommendCollCell.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/26.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit
import SnapKit

class RecommendCollCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    var titleLabel = UILabel()
    var btnAll = UIButton()
    var table = UITableView()
    var dataSource = Array<Any>()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = BACKGROUNDCOLOR
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
        
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.textColor = UIColor.red
        self.addSubview(titleLabel)
        
        btnAll.setTitle("查看全部", for: .normal)
        btnAll.setTitleColor(.red, for: .normal)
        btnAll.titleLabel?.font = .boldSystemFont(ofSize: 15)
        btnAll.addTarget(self, action: #selector(btnAllAction), for: .touchUpInside)
        btnAll.backgroundColor = .cyan
        btnAll.layer.cornerRadius = 15
        btnAll.layer.masksToBounds = true
        self.addSubview(btnAll)
        
        table = UITableView.init(frame: CGRect(), style: .grouped)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = BACKGROUNDCOLOR
        table.register(HotGameCell.self, forCellReuseIdentifier: HotGameCell.description())
        table.rowHeight = 55
        table.sectionHeaderHeight = 0.0001
        table.sectionFooterHeight = 0.0001
        self.addSubview(table)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(25)
            make.width.lessThanOrEqualTo(130)
        }
        btnAll.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-20)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        table.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-10)
        }
    }
    
    func updateData() {
        titleLabel.text = "推荐游戏"
        table.reloadData()
    }
    
    @objc func btnAllAction() {
        print("sddssddd")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HotGameCell.description(), for: indexPath) as? HotGameCell
        cell?.updateData(name: "绝地求生", detail: "100人团队竞技")
        return cell!
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
