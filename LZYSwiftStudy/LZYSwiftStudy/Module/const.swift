//
//  const.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/25.
//  Copyright © 2020 李志颖. All rights reserved.
//

import Foundation
import UIKit

// 屏幕宽
let SCREENWIDTH = UIScreen.main.bounds.width
// 屏幕高
let SCREENHEIGHT = UIScreen.main.bounds.height

//适配Iphone_X XR XS XSMax
let Is_Iphone = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone)
//刘海屏
let Is_Iphone_X_XS_XR_XSMAX = (Is_Iphone &&  SCREENHEIGHT >= 812)
// 状态栏高度
let STATUS_BAR_HEIGHT = Is_Iphone_X_XS_XR_XSMAX ? 44 : 20
// 导航栏高度
let NAVIGATION_BAR_HEIGHT  = Is_Iphone_X_XS_XR_XSMAX ? 88 : 64
// tabBar高度
let TAB_BAR_HEIGHT : CGFloat = Is_Iphone_X_XS_XR_XSMAX ? 49 + 34 : 49
// home indicator
let SAFE_BOTTOM_HEIGHT = Is_Iphone_X_XS_XR_XSMAX ? 34 : 0

let BACKGROUNDCOLOR = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1)

