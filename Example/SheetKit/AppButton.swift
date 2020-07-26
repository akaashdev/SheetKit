//
//  AppButton.swift
//  SheetKit_Example
//
//  Created by Akaash Dev on 18/11/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit

class AppButton: View {
    
    var contentPadding: CGFloat = 16 {
        didSet {
            setInsets(contentPadding)
        }
    }
    
    lazy var blurView: UIVisualEffectView = {
        if #available(iOS 13.0, *) {
            let effect = UIBlurEffect(style: .systemThinMaterial)
            let view = UIVisualEffectView(effect: effect)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        } else {
            let effect = UIBlurEffect(style: .prominent)
            let view = UIVisualEffectView(effect: effect)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
    }()
    
    lazy var button: UIButton = {
        let view = UIButton(type: .system)
        view.titleLabel?.font = Font.getMediumFont().bold
        view.setTitleColor(.labelColor, for: .normal)
        view.tintColor = .labelColor
        return view
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: button.intrinsicContentSize.width,
                      height: 48)
    }
    
    override func setupView() {
        super.setupView()
        setInsets(contentPadding)
        layer.masksToBounds = true
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(blurView)
        addSubview(button)
    }
    
    override func alignViews() {
        super.alignViews()
        blurView.frame = bounds
        button.frame = bounds
        layer.cornerRadius = bounds.height / 2
    }
    
    private func setInsets(_ padding: CGFloat) {
        button.contentEdgeInsets = UIEdgeInsets(top: padding,
                                                left: padding,
                                                bottom: padding,
                                                right: padding)
    }

}

