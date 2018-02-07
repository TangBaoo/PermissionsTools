//
//  PisPermissionsModel.swift
//  PermissionsDemo
//
//  Created by PisK on 2018/2/1.
//  Copyright © 2018年 PisK. All rights reserved.
//  权限提示基类
//

import UIKit

class PisPermissionsModel: NSObject {
    
    
    static func ShowView() {
        let vc = PisPerSelectViewController()
        getCurrentVC().present(vc, animated: true, completion: nil)
        
    }
    
    //获得当前窗口的视图
    static func getCurrentVC() -> UIViewController {
        
        var vc = UIApplication.shared.keyWindow?.rootViewController
        
        while (true)
        {
            //根据不同的页面切换方式，逐步取得最上层的viewController
            if vc?.isKind(of: UITabBarController.self) == true {
                vc = (vc as! UITabBarController).selectedViewController
            }
            else if vc?.isKind(of: UINavigationController.self) == true {
                vc = (vc as! UINavigationController).visibleViewController
            }
            else if ((vc?.presentedViewController) != nil) {
                vc = vc?.presentedViewController
            } else {
                break
            }
            
        }
        return vc!;
    }
}
