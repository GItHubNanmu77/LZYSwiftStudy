//
//  HotGameCell.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/25.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit
import SnapKit

class HotGameCell: UITableViewCell {

    var hasDownload : Bool?
    var logoImageV = UIImageView()
    var nameLabel = UILabel()
    var detailLabel = UILabel()
    var btnGet = UIButton()
    var btnGetBlock:((_ button : UIButton) -> Void)?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        logoImageV.backgroundColor = .red
        logoImageV.layer.cornerRadius = 20
        logoImageV.layer.masksToBounds = true
        self.addSubview(logoImageV)

        nameLabel.font = UIFont.systemFont(ofSize: 16)
        nameLabel.textColor = .black
        self.addSubview(nameLabel)
        
        detailLabel.font = UIFont.systemFont(ofSize: 13)
        detailLabel.textColor = .darkText
        detailLabel.numberOfLines = 0
        self.addSubview(detailLabel)
        
        btnGet.setTitle("获取", for: .normal)
        btnGet.backgroundColor = .cyan
        btnGet.layer.cornerRadius = 15
        btnGet.layer.masksToBounds = true
        btnGet.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btnGet.setTitleColor(.red, for: .normal)
        btnGet.addTarget(self, action: #selector(btnGetAction(_ : )), for: .touchUpInside)
        self.addSubview(btnGet)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        logoImageV.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(15)
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageV)
            make.left.equalTo(logoImageV.snp_rightMargin).offset(15)
        }
        detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(nameLabel)
        }
        btnGet.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
    }
    
    @objc func btnGetAction(_ sender : UIButton) {
        if hasDownload == true {
            sender.setTitle("已下载", for: .normal)
        } else {
            sender.setTitle("下载中", for: .normal)
        }
        btnGetBlock!(sender)
    }
    
     func updateData(logoImage: UIImage = UIImage(), name: String, detail: String, isDownload : Bool = false) {
        logoImageV.image = logoImage
        nameLabel.text = name
        detailLabel.text = detail
        self.hasDownload = isDownload
    }
}
