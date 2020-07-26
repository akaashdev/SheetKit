//
//  ColorUtils.swift
//  SheetKit
//
//  Created by Akaash Dev on 14/09/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit

extension UIColor {
    class var adaptiveBackground: UIColor {
        if #available(iOS 13.0, *) {
            return .systemBackground
        } else {
            return .white
        }
    }
    
    class var adaptiveSeparator: UIColor {
        if #available(iOS 13.0, *) {
            return .separator
        } else {
            return UIColor(white: 0.8, alpha: 1)
        }
    }
    
    class var adaptiveOpaqueSeparator: UIColor {
        if #available(iOS 13.0, *) {
            return .opaqueSeparator
        } else {
            return UIColor(white: 0.8, alpha: 1)
        }
    }
    
    class var adaptiveLabel: UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else {
            return .black
        }
    }
    class var adaptiveSecondaryLabel: UIColor {
        if #available(iOS 13.0, *) {
            return .secondaryLabel
        } else {
            return .gray
        }
    }
}

extension UIColor {
    class var appTeal: UIColor { return UIColor(hexValue: 0x50e3c2) }
    class var appDark: UIColor { return UIColor(hexValue: 0x4a4a4a) }
    
    class var darkerGray: UIColor { return UIColor(hexValue: 0x555555) }
    class var lighterGray: UIColor { return UIColor(hexValue: 0xd4d4d4) }
    
    class var separatorLineColor: UIColor { return UIColor(hexValue: 0xf0f0f0) }
    class var separatorColorLight: UIColor { return UIColor(white: 0.96, alpha: 1) }
    
    class var componentBackgroundColor: UIColor { return UIColor(hexValue: 0xf1f2f6) }
    
    class var successColor: UIColor { return UIColor(hexValue: 0x74d167) }
    class var failureColor: UIColor { return UIColor(hexValue: 0xff7967) }
    
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
    
    func equals(_ rhs: UIColor) -> Bool {
        var lhsR: CGFloat = 0
        var lhsG: CGFloat  = 0
        var lhsB: CGFloat = 0
        var lhsA: CGFloat  = 0
        self.getRed(&lhsR, green: &lhsG, blue: &lhsB, alpha: &lhsA)
        
        var rhsR: CGFloat = 0
        var rhsG: CGFloat  = 0
        var rhsB: CGFloat = 0
        var rhsA: CGFloat  = 0
        rhs.getRed(&rhsR, green: &rhsG, blue: &rhsB, alpha: &rhsA)
        
        return  lhsR == rhsR &&
            lhsG == rhsG &&
            lhsB == rhsB &&
            lhsA == rhsA
    }
    
}

