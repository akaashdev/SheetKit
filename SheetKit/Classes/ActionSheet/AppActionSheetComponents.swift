//
//  AppActionSheetComponents.swift
//  ZohoSocial
//
//  Created by Akaash Dev on 22/03/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit


extension UITableViewCell {
    
    func setDefaultSelectedBackgroundColor() {
        setSelectedBackgroundColor(.adaptiveOpaqueSeparator)
    }
    
    func setSelectedBackgroundColor(_ color: UIColor) {
        let view = UIView()
        view.backgroundColor = color
        selectedBackgroundView = view
    }
    
}


public class AppActionCell: UITableViewCell {
    
    let kPadding = AppActionItemConstant.kPadding
    let kImageViewSize = AppActionItemConstant.kImageViewSize
    let kImageViewWidth = AppActionItemConstant.kImageViewWidth
    let kContentFont = AppActionItemConstant.kContentFont
    
    //Overriddable methods
    public func setupCell(actionItem: AppActionItemProtocol) { }
    
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setDefaultSelectedBackgroundColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


public class AppActionSeperatorCell: AppActionCell {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .adaptiveOpaqueSeparator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public class AppActionHeaderCell: AppActionCell {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func setupCell(actionItem: AppActionItemProtocol) {
        label.text = actionItem.title
    }
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = Font.getRegularFont().semibold
        return view
    }()
    
    private func setupViews() {
        contentView.addSubview(label)
    }
    
    private func setupContraints() {
        label.alignVerticallyCenter()
        label.fillSuperViewWidth(padding: 12)
    }
    
}

public class AppActionButtonCell: AppActionCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func setupCell(actionItem: AppActionItemProtocol) {
        
        imageViewWidthConstraint.constant = actionItem.image == nil ? 0 : kImageViewWidth
        imageView_.image = actionItem.image?.withRenderingMode(.alwaysTemplate)
        label.text = actionItem.title
        
        let color: UIColor = actionItem.type == .destructiveButton ? .flatRed : .adaptiveLabel
        imageView_.tintColor = actionItem.imageTintColor ?? color
        label.textColor = color
        
    }
    
    private lazy var imageView_: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setConstantHeight(kImageViewSize)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = kContentFont
        return view
    }()
    
    private var imageViewWidthConstraint: NSLayoutConstraint!
    
    private func setupViews() {
        contentView.addSubviews([
            imageView_,
            label
        ])
    }
    
    private func setupContraints() {
        imageViewWidthConstraint = imageView_.widthAnchor.constraint(lessThanOrEqualToConstant: kImageViewWidth)  // |-kPadding/2 - (-30-) - kPadding/2 -|
        imageViewWidthConstraint.isActive = true
        imageView_.safeLeadingAnchor(padding: kPadding/2)
        imageView_.alignVerticallyCenter()
        
        label.alignVerticallyCenter()
        label.placeNextTo(view: imageView_, padding: kPadding/2)
        label.safeTrailingAnchor(padding: -kPadding)
    }
    
}


public class AppActionCancelButtonCell: AppActionCell {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSelectedBackgroundColor(.adaptiveBackground)
        
        setupViews()
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setConstantHeight(44)
        view.layer.cornerRadius = 12
        view.backgroundColor = .adaptiveOpaqueSeparator
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = kContentFont
        view.text = "Cancel"
        return view
    }()
    
    private var imageViewWidthConstraint: NSLayoutConstraint!
    
    private func setupViews() {
        contentView.addSubview(buttonView)
        buttonView.addSubview(label)
    }
    
    private func setupContraints() {
        buttonView.alignVerticallyCenter()
        buttonView.fillSuperViewWidth(padding: 24)
        
        label.alignCenter()
    }
    
}

public class AppActionTitleCell: AppActionCell {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSelectedBackgroundColor(.white)
        
        setupViews()
        setupContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func setupCell(actionItem: AppActionItemProtocol) {
        label.text = actionItem.title
    }
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = Font.getSmallFont().semibold
        view.textColor = .adaptiveSecondaryLabel
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    private func setupViews() {
        contentView.addSubview(label)
    }
    
    private func setupContraints() {
        label.fillSuperViewHeight(padding: 10)
        label.fillSuperViewWidth(padding: 20)
    }
    
}


public class AppActionCustomCell: AppActionCell {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSelectedBackgroundColor(.adaptiveBackground)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
