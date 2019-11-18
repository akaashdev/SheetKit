
//
//  ViewUtils.swift
//  ZohoSocial
//
//  Created by Akaash Dev on 08/09/17.
//  Copyright © 2017 Akaash Dev. All rights reserved.
//

import UIKit

enum Anchor { case leading, trailing, top, bottom }

struct ReadableLayoutInset {
    static let defaultLeft: CGFloat = 16
    static let defaultRight: CGFloat = 16
}

extension UIView {
    
    //MARK: Anchor methods without SafeLayout Guide
    @discardableResult
    func anchorTop(with view: UIView? = nil, padding: CGFloat = 0) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = topAnchor.constraint(equalTo: viewB.topAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func anchorBottom(with view: UIView? = nil, padding: CGFloat = 0) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = bottomAnchor.constraint(equalTo: viewB.bottomAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func anchorLeading(with view: UIView? = nil, padding: CGFloat = 0) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = leadingAnchor.constraint(equalTo: viewB.leadingAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func anchorTrailing(with view: UIView? = nil, padding: CGFloat = 0) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = trailingAnchor.constraint(equalTo: viewB.trailingAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    //MARK: Constant Dimension methods
    @discardableResult
    func setConstantHeight(_ height: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(equalToConstant: height)
        constraint.activate()
        return constraint
    }
    
    
    /// Less than or equal to constant
    @discardableResult
    func setConstantHuggingHeight(_ height: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(lessThanOrEqualToConstant: height)
        constraint.activate()
        return constraint
    }
    
    /// Greater than or equal to constant
    @discardableResult
    func setConstantRestrictingHeight(_ height: CGFloat) -> NSLayoutConstraint {
        let constraint = heightAnchor.constraint(greaterThanOrEqualToConstant: height)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func setConstantWidth(_ width: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(equalToConstant: width)
        constraint.activate()
        return constraint
    }
    
    
    /// Less than or equal to constant
    @discardableResult
    func setConstantHuggingWidth(_ width: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(lessThanOrEqualToConstant: width)
        constraint.activate()
        return constraint
    }
    
    /// Greater than or equal to constant
    @discardableResult
    func setConstantRestrictingWidth(_ width: CGFloat) -> NSLayoutConstraint {
        let constraint = widthAnchor.constraint(greaterThanOrEqualToConstant: width)
        constraint.activate()
        return constraint
    }
    
    func setDimensions(width: CGFloat, height: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).activate()
        heightAnchor.constraint(equalToConstant: height).activate()
    }
    
    /// Less than or equal to constant
    func setHuggingDimensions(width: CGFloat, height: CGFloat) {
        widthAnchor.constraint(lessThanOrEqualToConstant: width).activate()
        heightAnchor.constraint(lessThanOrEqualToConstant: height).activate()
    }
    
    /// Greater than or equal to constant
    func setResistingDimensions(width: CGFloat, height: CGFloat) {
        widthAnchor.constraint(greaterThanOrEqualToConstant: width).activate()
        heightAnchor.constraint(greaterThanOrEqualToConstant: height).activate()
    }
    
    //MARK: Anchor methods with SafeLayout Guide
    @discardableResult
    func safeLeadingAnchor(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint: NSLayoutConstraint
        if #available(iOS 11.0, *) {
            constraint = leadingAnchor.constraint(equalTo: viewB.safeAreaLayoutGuide.leadingAnchor, constant: padding)
        }
        else {
            constraint = leadingAnchor.constraint(equalTo: viewB.leadingAnchor, constant: padding)
        }
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func safeTrailingAnchor(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint: NSLayoutConstraint
        if #available(iOS 11.0, *) {
            constraint =  trailingAnchor.constraint(equalTo: viewB.safeAreaLayoutGuide.trailingAnchor, constant: padding)
        }
        else {
            constraint = trailingAnchor.constraint(equalTo: viewB.trailingAnchor, constant: padding)
        }
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func safeTopAnchor(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint: NSLayoutConstraint
        if #available(iOS 11.0, *) {
            constraint = topAnchor.constraint(equalTo: viewB.safeAreaLayoutGuide.topAnchor, constant: padding)
        } else {
            constraint = topAnchor.constraint(equalTo: viewB.topAnchor, constant: padding)
        }
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func safeBottomAnchor(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint: NSLayoutConstraint
        if #available(iOS 11.0, *) {
            constraint = bottomAnchor.constraint(equalTo: viewB.safeAreaLayoutGuide.bottomAnchor, constant: padding)
        } else {
            constraint = bottomAnchor.constraint(equalTo: viewB.bottomAnchor, constant: padding)
        }
        constraint.activate()
        return constraint
    }
    
    //MARK: Anchor methods with ReadableLayout Guide
    @discardableResult
    func readableLeadingAnchor(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = leadingAnchor.constraint(equalTo: viewB.readableContentGuide.leadingAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func readableTrailingAnchor(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = trailingAnchor.constraint(equalTo: viewB.readableContentGuide.trailingAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func readableTopAnchor(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = topAnchor.constraint(equalTo: viewB.readableContentGuide.topAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func readableBottomAnchor(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = bottomAnchor.constraint(equalTo: viewB.readableContentGuide.bottomAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    //MARK: Centering View methods
    @discardableResult
    func alignVerticallyCenter(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = centerYAnchor.constraint(equalTo: viewB.centerYAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func alignHorizontallyCenter(padding: CGFloat = 0, with view: UIView? = nil) -> NSLayoutConstraint? {
        guard let viewB = getViewB(view) else { return nil }
        let constraint = centerXAnchor.constraint(equalTo: viewB.centerXAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    func alignCenter(with view: UIView? = nil, xPadding: CGFloat = 0, yPadding: CGFloat = 0) {
        guard let viewB = getViewB(view) else { return }
        centerXAnchor.constraint(equalTo: viewB.centerXAnchor, constant: xPadding).activate()
        centerYAnchor.constraint(equalTo: viewB.centerYAnchor, constant: yPadding).activate()
    }
    
    //MARK: Anchoring Adjacent Views methods
    @discardableResult
    func placeBelow(view: UIView, padding: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = topAnchor.constraint(equalTo: view.bottomAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func placeAbove(view: UIView, padding: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = bottomAnchor.constraint(equalTo: view.topAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func placeNextTo(view: UIView, padding: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    @discardableResult
    func placeBeforeTo(view: UIView, padding: CGFloat = 0) -> NSLayoutConstraint {
        let constraint = trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
        constraint.activate()
        return constraint
    }
    
    //MARK: Matching Constraints methods
    func matchAllConstraints(of view: UIView) {
        leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
        trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        topAnchor.constraint(equalTo: view.topAnchor).activate()
        bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
    }
    
    func matchAllConstraints(of view: UIView, except ignoredAnchors: Set<Anchor>) {
        if !ignoredAnchors.contains(.leading) { leadingAnchor.constraint(equalTo: view.leadingAnchor).activate() }
        if !ignoredAnchors.contains(.trailing) { trailingAnchor.constraint(equalTo: view.trailingAnchor).activate() }
        if !ignoredAnchors.contains(.top) { topAnchor.constraint(equalTo: view.topAnchor).activate() }
        if !ignoredAnchors.contains(.bottom) { bottomAnchor.constraint(equalTo: view.bottomAnchor).activate() }
    }
    
    func matchContraint(_ anchor: Anchor, ofView view: UIView, padding: UIEdgeInsets = .zero) {
        matchContraints([anchor], ofView: view, padding: padding)
    }
    
    func matchContraints(_ anchors: Set<Anchor>, ofView view: UIView, padding: UIEdgeInsets = .zero) {
        if anchors.contains(.top) { topAnchor.constraint(equalTo: view.topAnchor, constant: padding.top).activate() }
        if anchors.contains(.leading) { leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding.left).activate() }
        if anchors.contains(.trailing) { trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding.right).activate() }
        if anchors.contains(.bottom) { bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: padding.bottom).activate() }
    }
    
    //MARK: Seperator line methods
    @discardableResult
    func asSeperatorLine(below: UIView, space: CGFloat = 0, padding: CGFloat = 0, color: UIColor = .lightGray) -> NSLayoutConstraint? {
        guard let _ = superview else {
            return nil
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        self.fillSuperViewWidth(padding: padding)
        self.alpha = 0.7
        self.heightAnchor.constraint(equalToConstant: 0.8).activate()
        let constraint = self.topAnchor.constraint(equalTo: below.bottomAnchor, constant: space)
        constraint.activate()
        return constraint
    }
    
    func addSeparatorLine(below view: UIView, space: CGFloat = 0, padding: CGFloat = 0, color: UIColor = .lightGray) {
        let line = UIView()
        addSubview(line)
        line.asSeperatorLine(below: view, space: space, padding: padding, color: color)
    }
    
    func addBottomLine(insets: UIEdgeInsets = .zero, color: UIColor = .lightGray, lineHeight: CGFloat = 0.8, lineAlpha: CGFloat = 0.7) {
        let line: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = color
            view.alpha = lineAlpha
            view.setConstantHeight(lineHeight)
            return view
        }()
        
        addSubview(line)
        
        line.safeLeadingAnchor(padding: insets.left)
        line.safeTrailingAnchor(padding: insets.right)
        line.anchorBottom(padding: -insets.bottom)
    }
    
    //MARK: Fill Superview methods
    func fillSuperViewWidth(padding: CGFloat = 0, safeLayout: Bool = true) {
        if safeLayout {
            safeLeadingAnchor(padding: padding)
            safeTrailingAnchor(padding: -padding)
        } else {
            anchorLeading(padding: padding)
            anchorTrailing(padding: -padding)
        }
    }
    
    func fillSuperViewHeight(padding: CGFloat = 0, safeLayout: Bool = true) {
        if safeLayout {
            safeTopAnchor(padding: padding)
            safeBottomAnchor(padding: -padding)
        } else {
            anchorTop(padding: padding)
            anchorBottom(padding: -padding)
        }
    }
    
    func fillSuperView(padding: CGFloat = 0, safeLayout: Bool = true) {
        fillSuperViewWidth(padding: padding, safeLayout: safeLayout)
        fillSuperViewHeight(padding: padding, safeLayout: safeLayout)
    }
    
    //MARK: Fill Superview Readable Layout methods
    func fillSuperViewReadableWidth(padding: CGFloat = 0) {
        readableLeadingAnchor(padding: padding)
        readableTrailingAnchor(padding: -padding)
    }
    
    func fillSuperViewReadableHeight(padding: CGFloat = 0) {
        readableTopAnchor(padding: padding)
        readableBottomAnchor(padding: -padding)
    }
    
    func fillSuperViewWithReadableLayoutGuide(padding: CGFloat = 0) {
        fillSuperViewReadableWidth(padding: padding)
        fillSuperViewReadableHeight(padding: padding)
    }
    
    //MARK: Adding Guidelines for reference
    func addGuideLine(xDistance: CGFloat?, yDistance: CGFloat?) {
        if let xDis = xDistance {
            let view: UIView! = {
                let view = UIView()
                view.backgroundColor = UIColor(displayP3Red: 0, green: 1, blue: 0, alpha: 0.5)
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            addSubview(view)
            
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xDis.rounded()).activate()
            view.fillSuperViewHeight()
            view.widthAnchor.constraint(equalToConstant: 0.25).activate()
        }
        
        if let yDis = yDistance {
            let view: UIView! = {
                let view = UIView()
                view.backgroundColor = UIColor(displayP3Red: 0, green: 1, blue: 0, alpha: 0.5)
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            addSubview(view)
            
            view.topAnchor.constraint(equalTo: topAnchor, constant: yDis.rounded()).activate()
            view.fillSuperViewWidth()
            view.heightAnchor.constraint(equalToConstant: 0.25).activate()
        }
    }
    
    func addCenterGuideLines() {
        addGuideLine(xDistance: self.frame.width/2, yDistance: self.frame.height/2)
    }
    
    
    //MARK: Helper methods
    func addSubviews(_ views: [UIView]) {
        views.forEach { addSubview($0) }
    }
    
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    func showTopBorder(thickness: CGFloat = 0.25) {
        let border: UIView! = {
            let view = UIView()
            view.backgroundColor = .lightGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        addSubview(border)
        border.fillSuperViewWidth()
        border.topAnchor.constraint(equalTo: topAnchor).activate()
        border.heightAnchor.constraint(equalToConstant: thickness).activate()
    }
    
    
    //MARK: Private methods
    private func getViewB(_ view: UIView?, function: String = #function) -> UIView? {
        guard let viewB = view ?? superview else {
            print("Secondary view is nil. \(function) failed.")
            return nil
        }
        return viewB
    }
    
}


extension NSLayoutConstraint {
    
    @discardableResult
    func prioritize(_ level: UILayoutPriority) -> NSLayoutConstraint {
        priority = level
        return self
    }
    
    @discardableResult
    func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
    
    @discardableResult
    func deactivate() -> NSLayoutConstraint {
        isActive = false
        return self
    }
    
}
