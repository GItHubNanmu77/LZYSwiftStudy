//
//  FontViewController.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/22.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit
import SnapKit

class FontViewController: UIViewController {
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        label.text = "font name"
        label.textColor = UIColor.red
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        button.setTitle("change font", for: .normal)
        button.backgroundColor = UIColor.cyan
        button.setTitleColor(UIColor.red, for: UIControl.State.normal)
        button.addTarget(self, action:#selector(changeFontFunc), for: UIControl.Event.touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        self.view.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp_bottomMargin).offset(100)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
        
    }
    var index = 0
    @objc func changeFontFunc() {
        index += 1
        if index < UIFont.familyNames.count {
            let fontName = UIFont.familyNames[index]
            label.font = UIFont(name: fontName, size: 35)
            label.text = fontName
            print(index)
        } else {
            printAllSupportedFontNames()
            print("字体已全部展示完成")
        }
    }
    func printAllSupportedFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            print("++++++ \(familyName)")
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("----- \(fontName)")
            }
        }
    }
}


