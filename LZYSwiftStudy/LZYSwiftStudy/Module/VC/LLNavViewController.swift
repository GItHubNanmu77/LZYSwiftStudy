//
//  LLNavViewController.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/23.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit

class LLNavViewController: UINavigationController {
    
    override func viewDidLoad() {
            super.viewDidLoad()
            let navigationBar = UINavigationBar.appearance()
        navigationBar.barTintColor = UIColor.white
        var image = UIImage()
        image = image.imageWithColor(color: UIColor.white, size: CGSize(width: UIScreen.main.bounds.width, height: 44))
        navigationBar.setBackgroundImage(image, for: UIBarMetrics.default)
        // 去掉黑线
        navigationBar.shadowImage = UIImage()
        
        }

        
        // 拦截 push 操作
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            if viewControllers.count > 0 {
                viewController.hidesBottomBarWhenPushed = true
                viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Nav_Back_Icon"), style: .plain, target: self, action: #selector(navigationBack))
            }
            super.pushViewController(viewController, animated: true)
        }
        
        /// 返回上一控制器
        @objc private func navigationBack() {
            popViewController(animated: true)
        }
}

extension UIImage {
     func imageWithColor(color: UIColor, size : CGSize) -> (UIImage) {
         let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
         UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
         let content = UIGraphicsGetCurrentContext()
         content?.setFillColor(color.cgColor)
         content?.fill(rect)
         let image = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
         return image!
     }
}

