//
//  UIColor+Extension.swift
//  DYZB
//
//  Created by liangxinchang on 2019/11/26.
//  Copyright © 2019 liangxinchang. All rights reserved.
//

import UIKit

extension UIColor {
    
   class func randomRGB() -> UIColor {
       return UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1)
   }
    
}
