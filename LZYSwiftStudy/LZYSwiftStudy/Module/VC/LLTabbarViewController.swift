//
//  LLTabbarViewController.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/23.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit

class LLTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        initChildrenVC()
        
    }
    
    func initChildrenVC() {
        initNaviagtionController(vc: HomeViewController(), title: "首页", image: "apple", selectedImage: "apple-select")
        initNaviagtionController(vc: MineViewController(), title: "我的", image: "update", selectedImage: "update-select")
    }
    
    func initNaviagtionController(vc: UIViewController, title: String, image: String, selectedImage: String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)
        addChild(LLNavViewController(rootViewController: vc))
    }
    

    

}
