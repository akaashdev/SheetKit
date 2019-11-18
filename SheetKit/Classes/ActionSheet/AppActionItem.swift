//
//  AppActionItem.swift
//  ZohoSocial
//
//  Created by Akaash Dev on 22/03/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit


public enum AppActionItemType: Equatable {
    case button, separator, header, destructiveButton, cancelButton, title, custom(_ height: CGFloat)
    
    public var rowHeight: CGFloat {
        switch self {
        case .button, .destructiveButton: return 54
        case .cancelButton: return 60
        case .separator: return 15
        case .header: return 30
        case .title: return UITableView.automaticDimension
        case .custom(let height): return height
        }
    }
    
    public static func ==(lhs: AppActionItemType, rhs: AppActionItemType) -> Bool {
        switch (lhs, rhs) {
        case (.button, .button),
             (.destructiveButton, .destructiveButton),
             (.cancelButton, .cancelButton),
             (.separator, .separator),
             (.header, .header),
             (.title, .title),
             (.custom, .custom):
            return true
            
        default:
            return false
        }
    }
    
}


public struct AppActionItemConstant {
    public static let kPadding: CGFloat = 18
    public static let kImageViewSize: CGFloat = 22
    public static let kImageViewWidth: CGFloat = kImageViewSize + kPadding
    public static let kContentFont: UIFont = Font.getRegularFont().medium
}



public protocol AppActionItemProtocol {
    var type: AppActionItemType { get }
    var title: String? { get }
    var image: UIImage? { get }
    var imageTintColor: UIColor? { get }
    var handler: AppActionItem.ActionHandler { get }
}

public extension AppActionItemProtocol {
    typealias ActionHandler = ((AppActionItemProtocol)->())?
    typealias CustomizeViewHandler = ((UIView)->())
}


public struct AppActionItem: AppActionItemProtocol {
    
    public let type: AppActionItemType
    public let title: String?
    public let image: UIImage?
    public let imageTintColor: UIColor?
    public let handler: ActionHandler
    
    public init(type: AppActionItemType, title: String? = nil, image: UIImage? = nil, imageTintColor: UIColor? = nil, handler: ActionHandler = nil) {
        self.type = type
        self.title = title
        self.image = image
        self.imageTintColor = imageTintColor
        self.handler = handler
    }
    
}


public struct CustomAppActionItem: AppActionItemProtocol {
    
    public let type: AppActionItemType
    public let title: String?
    public let image: UIImage?
    public let imageTintColor: UIColor?
    public let handler: ActionHandler
    public let viewHandler: CustomizeViewHandler
    
    public init(viewHandler: @escaping CustomizeViewHandler, viewHeight: CGFloat, title: String? = nil, image: UIImage? = nil, imageTintColor: UIColor? = nil, handler: ActionHandler = nil) {
        self.type = .custom(viewHeight)
        self.viewHandler = viewHandler
        self.title = title
        self.image = image
        self.imageTintColor = imageTintColor
        self.handler = handler
    }
    
}
