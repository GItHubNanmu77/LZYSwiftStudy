//
//  HomeTitleView.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/23.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit
import SnapKit

class HomeTitleView: UIView {
    var timeLabel = UILabel.init()
    var nameLabel = UILabel.init()
    var headerImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        timeLabel.text = "2020-02-22"
        timeLabel.textColor = UIColor.red
        timeLabel.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(timeLabel)
        
        nameLabel.text = "Today"
        nameLabel.font = UIFont.systemFont(ofSize: 30)
        nameLabel.textColor = .black
        self.addSubview(nameLabel)
        
        headerImageView.backgroundColor = .blue
        headerImageView.layer.cornerRadius = 20
        headerImageView.layer.masksToBounds = true
        self.addSubview(headerImageView)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(20)
        }
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(timeLabel.snp_bottomMargin).offset(10)
            make.left.equalTo(20)
        }
        headerImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(-20)
            make.width.height.equalTo(40)
        }
    }
    
    func updateData(time: String, name: String , header: UIImage = UIImage.init())  {
        timeLabel.text = time
        nameLabel.text = name
        headerImageView.image = header
    }
}
