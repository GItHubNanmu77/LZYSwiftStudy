//
//  HomeViewController.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/23.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

//    var titleView = HomeTitleView.init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(hometitleView)
        
        hometitleView.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.width.equalTo(self.view)
            make.height.equalTo(60)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

    private lazy var hometitleView : HomeTitleView = {
        let home = HomeTitleView.init()
        home.updateData(time: "1999-21", name: "明天")
        
        return home
    }()
}
