//
//  FontUtils.swift
//  ZohoSocial
//
//  Created by Akaash Dev on 19/12/18.
//  Copyright © 2018 Akaash Dev. All rights reserved.
//

import UIKit

struct Font {
    
    /// Size - 26
    static func getLargeHeaderFont() -> UIFont {
        return UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    /// Size - 24
    static func getExtraLargeFont() -> UIFont {
        return UIFont.systemFont(ofSize: 24)
    }
    
    /// Size - 20
    static func getLargeFont() -> UIFont {
        return UIFont.systemFont(ofSize: 20)
    }
    
    /// Size - 18
    static func getMediumFont() -> UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
    
    /// Size - 16
    static func getRegularFont() -> UIFont {
        return UIFont.systemFont(ofSize: 16)
    }
    
    /// Size - 14
    static func getSmallFont() -> UIFont {
        return UIFont.systemFont(ofSize: 14)
    }
    
    /// Size - 12
    static func getVerySmallFont() -> UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    
    static func ofSize(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
}


extension UIFont {
    
    var bold: UIFont {
        return .boldSystemFont(ofSize: pointSize)
    }
    
    var semibold: UIFont {
        return .systemFont(ofSize: pointSize, weight: .semibold)
    }
    
    var medium: UIFont {
        return .systemFont(ofSize: pointSize, weight: .medium)
    }
    
    var italic: UIFont {
        return .italicSystemFont(ofSize: pointSize)
    }
    
    var heavy: UIFont {
        return .systemFont(ofSize: pointSize, weight: .heavy)
    }
    
    var black: UIFont {
        return .systemFont(ofSize: pointSize, weight: .black)
    }
    
    var thin: UIFont {
        return .systemFont(ofSize: pointSize, weight: .thin)
    }
    
    var light: UIFont {
        return .systemFont(ofSize: pointSize, weight: .light)
    }
    
    var ultraLight: UIFont {
        return .systemFont(ofSize: pointSize, weight: .ultraLight)
    }
    
}


extension Font {
    
    static let kMessageIconFontName = "Message-icons"
    
    static let kMessageIconPhotosCode = "\u{e903}"
    static let kMessageIconVideoCode = "\u{e901}"
    static let kMessageIconGIFCode = "\u{e904}"
    static let kMessageIconStickerCode = "\u{e902}"
    static let kMessageIconFileCode = "\u{e905}"
    
}
