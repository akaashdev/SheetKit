//
//  PreviewViewController.swift
//  SheetKit
//
//  Created by Akaash Dev on 03/11/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit

public enum Dimension {
    case absolute(_ value: CGFloat)
    case fractional(_ mult: CGFloat)
    case fill(_ constant: CGFloat)
    
    public func value(relativeTo value: CGFloat) -> CGFloat {
        switch self {
        case .absolute(let constant): return constant
        case .fractional(let multiplier): return multiplier * value
        case .fill(let padd): return value + padd
        }
    }
}

public class PreviewViewController: ViewController, UIGestureRecognizerDelegate {
    
    //MARK: Properties
    public var minimumPreviewHeight: Dimension? = .fractional(0.54)
    public var maximumPreviewHeight: Dimension = .fill(-10)
    public var preferredPreviewHeight: Dimension? = nil
    
    public var initialPosition: PreviewView.InitialPosition = .preview
    
    public var thresholdVelocity: CGFloat = 3000
    public var presentationDuration: TimeInterval = 0.4
    public var animationDuration: TimeInterval = 0.6
    public var springDampingRatio: CGFloat = 0.9
    
    public var totalContentHeight: CGFloat {
        return previewView.headerHeight + scrollView.contentSize.height
    }
    
    private var minimumTopSpaceHeight: CGFloat {
        return view.bounds.height - maximumPreviewHeight.value(relativeTo: view.bounds.height)
    }
    
    private var collapsedModeTopSpaceHeight: CGFloat {
        if let dimension = minimumPreviewHeight {
            return view.bounds.height - dimension.value(relativeTo: view.bounds.height) - view.safeAreaInsets.bottom - view.safeAreaInsets.top
        }
        return expandedTopSpaceHeight
    }
    
    private var previewModeTopSpaceHeight: CGFloat {
        if let dimension = preferredPreviewHeight {
            return view.bounds.height - dimension.value(relativeTo: view.bounds.height) - view.safeAreaInsets.bottom - view.safeAreaInsets.top
        }
        return expandedTopSpaceHeight
    }
    
    private var expandedTopSpaceHeight: CGFloat {
        let calcInset = view.bounds.height - totalContentHeight - view.safeAreaInsets.bottom - view.safeAreaInsets.top
        return max(minimumTopSpaceHeight, calcInset)
    }
    
    //MARK: Views
    public var scrollView: UIScrollView {
        return previewView.scrollView
    }
    
    public var contentView: UIView {
        return previewView.contentView
    }
    
    public lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let gesture = UIPanGestureRecognizer()
        gesture.addTarget(self, action: #selector(handlePanGestureRegonizer(_:)))
        gesture.delegate = self
        return gesture
    }()
    
    public lazy var previewView: PreviewView = {
        let view = PreviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addGestureRecognizer(panGestureRecognizer)
        return view
    }()
    
    public lazy var screenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.adaptiveOpaqueSeparator.withAlphaComponent(0.7)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismissAction)))
        return view
    }()
    
    //MARK: Initializers
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Layout Methods
    private var firstTime: Bool = true
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if firstTime {
            firstTime = false
            view.layoutIfNeeded()
            previewViewTopConstraint?.constant = getInitialTopSpaceConstant()
            UIView.animate(
                withDuration: presentationDuration,
                animations: { self.view.layoutIfNeeded() }
            )
        }
    }
    
    override public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        guard flag else {
            super.dismiss(animated: flag, completion: completion)
            return
        }
        
        previewViewTopConstraint?.constant = view.bounds.height
        UIView.animate(
            withDuration: presentationDuration,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                self.screenView.alpha = 0
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                super.dismiss(animated: false, completion: completion)
            }
        )
    }
    
    //MARK: Gesture Delegates
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if let scrollView = otherGestureRecognizer.view as? UIScrollView {
            return scrollView.contentOffset.y <= 0
        }
        return false
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            scrollView.bounces = (scrollView.contentOffset.y > 0) || (panRecognizer.verticalDirection == .up)
            return abs((panRecognizer.velocity(in: view)).x) < abs((panRecognizer.velocity(in: view)).y)
        }
        return false
    }
    
    //MARK: Actions
    private var initialTopInset: CGFloat = 0
    @objc private func handlePanGestureRegonizer(_ recognizer: UIPanGestureRecognizer) {
        guard let constraint = previewViewTopConstraint else { return }
        
        let minInset = minimumTopSpaceHeight
        let adaptiveInset = expandedTopSpaceHeight
        
        switch recognizer.state {
        case .began:
            initialTopInset = constraint.constant
            
        case .changed:
            let calcInset = initialTopInset + recognizer.translation(in: view).y
            let finalInset = adaptiveInset > calcInset ? adaptiveInset - (adaptiveInset - calcInset) / 3 : calcInset
            let inset = max(minInset, finalInset)
            constraint.constant = inset
            screenView.alpha = getScreenAlpha(at: inset)
            
        case .cancelled, .ended:
            completeDrag(
                position: constraint.constant,
                velocity: recognizer.velocity(in: view).y
            )
            
        default:
            return
        }
    }
    
    @objc private func handleDismissAction() {
        dismiss(animated: true)
    }
    
    //MARK: Private Methods
    private func getInitialTopSpaceConstant() -> CGFloat {
        switch initialPosition {
        case .collapsed: return collapsedModeTopSpaceHeight
        case .preview: return previewModeTopSpaceHeight
        case .expanded: return expandedTopSpaceHeight
        }
    }
    
    private func getScreenAlpha(at position: CGFloat) -> CGFloat {
        if position > collapsedModeTopSpaceHeight {
            let diff = position - collapsedModeTopSpaceHeight
            let totalDistance = view.bounds.height - collapsedModeTopSpaceHeight
            let delta = diff / totalDistance
            return 1 - delta
        }
        return 1
    }
    
    private func getNearestClosingPostion(for position: CGFloat) -> CGFloat {
        if let _ = preferredPreviewHeight {
            return position < previewModeTopSpaceHeight ? previewModeTopSpaceHeight : collapsedModeTopSpaceHeight
        }
        return collapsedModeTopSpaceHeight
    }
    
    private func getNearestExpansionPostion(for position: CGFloat) -> CGFloat {
        if let _ = preferredPreviewHeight {
            return position > previewModeTopSpaceHeight ? previewModeTopSpaceHeight : expandedTopSpaceHeight
        }
        return expandedTopSpaceHeight
    }
    
    private func getFinalPosition(for position: CGFloat, velocity: CGFloat) -> CGFloat {
        if position > collapsedModeTopSpaceHeight {
            // Dismissal case
            return view.bounds.height
        }
        
        let isExpanding = velocity < 0
        let velocityMag = abs(velocity)
        
        if velocityMag > thresholdVelocity {
            // High velocity case. Ignoring middle preview stage.
            return isExpanding ? expandedTopSpaceHeight : collapsedModeTopSpaceHeight
        }
        
        return isExpanding ? getNearestExpansionPostion(for: position) : getNearestClosingPostion(for: position)
    }
    
    private func completeDrag(position: CGFloat, velocity: CGFloat) {
        guard let constraint = previewViewTopConstraint else { return }
    
        let completionInset = getFinalPosition(for: position, velocity: velocity)
        let isDismissal = completionInset == view.bounds.height
        constraint.constant = completionInset
        
        scrollView.isScrollEnabled = constraint.constant == minimumTopSpaceHeight
        UIView.animate(
            withDuration: isDismissal ? presentationDuration : animationDuration,
            delay: 0,
            usingSpringWithDamping: springDampingRatio,
            initialSpringVelocity: abs(velocity) / thresholdVelocity,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: {
                self.screenView.alpha = isDismissal ? 0 : 1
                self.view.layoutIfNeeded()
            },
            completion: { _ in
                if isDismissal { self.dismiss(animated: false) }
            }
        )
    }
    
    //MARK: Constraints
    override func setupViews() {
        super.setupViews()
        view.addSubview(screenView)
        view.addSubview(previewView)
    }
    
    private var previewViewTopConstraint: NSLayoutConstraint?
    
    override func setupConstraints() {
        super.setupConstraints()
        
        screenView.fillSuperView(safeLayout: false)
        
        previewView.fillSuperViewReadableWidth(padding: -16)
        previewView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -minimumTopSpaceHeight).activate()
        previewViewTopConstraint = previewView.safeTopAnchor(padding: 1000)
    }
    
}
