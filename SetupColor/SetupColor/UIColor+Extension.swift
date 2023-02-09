//
//  UIColor+Extension.swift
//  SetupColor
//
//  Created by kris on 2023/1/2.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
    }
    
    convenience init?(hex: String, alpha: CGFloat = 1.0) {
        //1.判断字符串长度是否符合
        guard hex.count >= 6 else {
            return nil
        }
        
        //2.将字符串转成大写
        var tempHex = hex.uppercased()
        
        //3.判断开头：#、##、0x
        if hex.hasPrefix("##") || hex.hasPrefix("0x") {
            tempHex = (tempHex as NSString).substring(from: 2)
        }
        
        if hex.hasPrefix("#") {
            tempHex = (tempHex as NSString).substring(from: 1)
        }
        
        //4.分别取出R、G、B
        var range = NSRange(location: 0, length: 2)
        let rHex = (hex as NSString).substring(with: range)
        range.location = 2
        let gHex = (hex as NSString).substring(with: range)
        range.location = 4
        let bHex = (hex as NSString).substring(with: range)
        
        //5.将十六进制转成数字
        var r: UInt64 = 0, g: UInt64 = 0, b: UInt64 = 0
        Scanner(string: rHex).scanHexInt64(&r)
        Scanner(string: gHex).scanHexInt64(&g)
        Scanner(string: bHex).scanHexInt64(&b)
        
        self.init(r: CGFloat(r), g: CGFloat(g), b: CGFloat(b))
        
    }
    
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
