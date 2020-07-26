//
//  PreviewTableView.swift
//  SheetKit
//
//  Created by Akaash Dev on 11/06/18.
//  Copyright © 2018 Akaash Dev. All rights reserved.
//

import UIKit


public class PreviewView: View {
    
    //MARK: Private Properties
    private let kHeaderMinHeight: CGFloat = 20
    private var _headerHeight: CGFloat = 20 {
        didSet {
            headerHeightContraint?.constant = _headerHeight
            alignViews()
        }
    }
    
    public var headerHeight: CGFloat {
        get { return _headerHeight }
        set { _headerHeight = max(kHeaderMinHeight, newValue) }
    }
    
    //MARK: Views
    public lazy var handleView: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 40, height: 4)
        view.backgroundColor = .adaptiveOpaqueSeparator
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        return view
    }()
    
    public lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .adaptiveBackground
        return view
    }()
    
    public lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .adaptiveBackground
        view.bounces = false
        view.isScrollEnabled = false
        return view
    }()
    
    public lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Layout Methods
    override func setupView() {
        super.setupView()
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 12
        layer.masksToBounds = true
    }
    
    override func setupSubviews() {
        super.setupSubviews()
        addSubview(headerView)
        headerView.addSubview(handleView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    
    private var headerHeightContraint: NSLayoutConstraint?
    
    override func setupConstraints() {
        super.setupConstraints()
        
        headerView.anchorTop()
        headerView.fillSuperViewWidth(safeLayout: false)
        headerHeightContraint = headerView.setConstantHeight(headerHeight)
        
        scrollView.placeBelow(view: headerView)
        scrollView.anchorBottom()
        scrollView.fillSuperViewWidth(safeLayout: false)
        
        contentView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        contentView.matchAllConstraints(of: scrollView)
    }
    
    override func alignViews() {
        super.alignViews()
        handleView.center = CGPoint(x: headerView.frame.midX,
                                    y: kHeaderMinHeight / 2)
        scrollView.contentInset.bottom = safeAreaInsets.bottom
    }
    
}


class PreviewTableView: PreviewView {
    
    //MARK: Views
    public lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bounces = false
        view.isScrollEnabled = false
        return view
    }()
    
    //MARK: Layout Methods
    override func setupView() {
        super.setupView()
        scrollView = tableView
    }
    
}


public extension PreviewView {
    
    enum InitialPosition {
        case collapsed, preview, expanded
    }
    
}
