//
//  CSHiep.swift
//  Codeshara
//
//  Created by 千锋 on 16/10/13.
//  Copyright © 2016年 wengqiang. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
        let g = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
        let b = CGFloat(arc4random_uniform(128)) / 256.0 + 0.5
        
        return UIColor.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}
