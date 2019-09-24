//
//  UIBarButtonItem-Extension.swift
//  DYZB
//
//  Created by 梁新昌 on 2019/2/14.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
/** 这个是给UIBarButtonItem 添加了一个类方法
    class func createItem(imageName:String, highImageName:String, size:CGSize) -> UIBarButtonItem{
        let btn = UIButton.init()
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        btn.setImage(UIImage.init(named: highImageName), for: .highlighted)
        btn.frame = CGRect.init(origin: CGPoint.zero, size: size)
        return UIBarButtonItem.init(customView: btn)
    }
*/
  // 创建便利构造函数
    /**
     1.使用 convenience 开头
     2.在构造函数中必须明确调用一个设计的构造函数(self)
     */
    
    convenience init(imageName:String, highImageName:String = "", size:CGSize = CGSize.zero) {
        let btn = UIButton.init()
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        if highImageName != "" {
            btn.setImage(UIImage.init(named: highImageName), for: .highlighted)
        }
        if size == CGSize.zero {
            btn.sizeToFit()
        } else {
            btn.frame = CGRect.init(origin: CGPoint.zero, size: size)
        }
        self.init(customView: btn)
    }
}
