//
//  ToadyCell.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/25.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit
import SnapKit

class ToadyCell: UITableViewCell {

    var backView = UIView()
    var nameLabel = UILabel()
    var backImage  = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        backView.backgroundColor = BACKGROUNDCOLOR
        backView.layer.cornerRadius = 10
        backView.layer.masksToBounds = true
        self.addSubview(backView)
        
        nameLabel.text = "name"
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textColor = .red
        backView.addSubview(nameLabel)
        
        backImage.image = UIImage()
        backImage.backgroundColor = .green
        backView.addSubview(backImage)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func layout() {
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
        }
        backImage.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
    }
    
    func updateData(name: String, imageName: String = "placeholder") {
        nameLabel.text = name
    }
}
