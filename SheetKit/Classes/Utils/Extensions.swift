//
//  Extensions.swift
//  ADActionSheet
//
//  Created by Akaash Dev on 04/10/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit

struct Height {
    static let mainScreen: CGFloat = UIScreen.main.bounds.height
    static let safeAreaTopInset: CGFloat = 34
    static let safeAreaBottomInset: CGFloat = 34
}

struct Width {
    static let mainScreen: CGFloat = UIScreen.main.bounds.width
}


extension CGRect {
    
    var height: CGFloat {
        get { return size.height }
        set { size = CGSize(width: size.width, height: newValue) }
    }
    
    var width: CGFloat {
        get { return size.width }
        set { size = CGSize(width: newValue, height: size.height) }
    }
    
}


extension UIGestureRecognizer.State {
    var description: String {
        switch self {
        case .began: return "began"
        case .cancelled: return "cancelled"
        case .changed: return "changed"
        case .ended: return "ended"
        case .failed: return "failed"
        case .possible: return "possible"
        @unknown default: return "unknown case"
        }
    }
}


enum HorizontalPanDirection {
    case left, right, none
    var description: String {
        switch self {
        case .left: return "Pan Left"
        case .right: return "Pan Right"
        case .none: return "None"
        }
    }
}

enum VerticalPanDirection {
    case up, down, none
    var description: String {
        switch self {
        case .up: return "Pan Up"
        case .down: return "Pan Down"
        case .none: return "None"
        }
    }
}

extension UIPanGestureRecognizer {
    var horizontalDirection: HorizontalPanDirection {
        if velocity(in: view).y == 0 {
            return .none
        }
        
        if let view = view, UIView.userInterfaceLayoutDirection(for: view.semanticContentAttribute) == .rightToLeft {
            return self.velocity(in: view).x > 0 ? .left : .right
        }
        
        return self.velocity(in: view).x < 0 ? .left : .right
    }
    
    var verticalDirection: VerticalPanDirection {
        if velocity(in: view).y == 0 {
            return .none
        }
        return velocity(in: view).y < 0 ? .up : .down
    }
}
