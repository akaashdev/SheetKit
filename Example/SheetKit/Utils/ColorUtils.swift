//
//  ColorUtils.swift
//  SheetKit_Example
//
//  Created by Akaash Dev on 18/11/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension UIColor {
    class var labelColor: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
    
    class var flatRed: UIColor { return UIColor(hexValue: 0xc0392b) }
    class var flatYellow: UIColor { return UIColor(hexValue: 0xf1c40f) }
    class var flatOrange: UIColor { return UIColor(hexValue: 0xe67e22) }
    class var flatBlue: UIColor { return UIColor(hexValue: 0x2980b9) }
    class var flatGray: UIColor { return UIColor(hexValue: 0x7f8c8d) }
    class var flatRock: UIColor { return UIColor(hexValue: 0x2c3e50) }
    class var flatGreen: UIColor { return UIColor(hexValue: 0x27ae60) }
    
    convenience init(red: Float, green: Float, blue: Float) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(
            displayP3Red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: 1.0
        )
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: Float(red), green: Float(green), blue: Float(blue))
    }
    
    convenience init(hexValue: Int) {
        self.init(
            red: (hexValue >> 16) & 0xFF,
            green: (hexValue >> 8) & 0xFF,
            blue: hexValue & 0xFF
        )
    }
}
