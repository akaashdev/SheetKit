//
//  AppActionSheetController.swift
//  SheetKit
//
//  Created by Akaash Dev on 26/12/18.
//  Copyright © 2018 Akaash Dev. All rights reserved.
//

import UIKit

public protocol PopOverSourceView: class {  }
extension UIView: PopOverSourceView {  }
extension UIBarButtonItem: PopOverSourceView {  }

public class AppActionSheetController: PreviewTableViewController, AppActionSheetControllerProtocol {
    
    //MARK: Properties
    public var sheetManager: AppActionSheetManager {
        return _sheetManager
    }
    
    private lazy var _sheetManager = AppActionSheetManager(actionSheetController: self, ignoresCancelButton: false)
    
    //MARK: Initializers
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        minimumPreviewHeight = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: Views and Constraints
    private func setupTableView() {
        tableView.dataSource = sheetManager
        tableView.delegate = sheetManager
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
}


public class AppActionSheetPopViewController: UITableViewController, AppActionSheetControllerProtocol {
    
    //MARK: Properties
    public weak var sourceView: PopOverSourceView?
    
    public var sheetManager: AppActionSheetManager {
        return _sheetManager
    }
    
    private lazy var _sheetManager = AppActionSheetManager(actionSheetController: self, ignoresCancelButton: true)
    
    //MARK: Initializers
    public init(sourceView: PopOverSourceView) {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .popover
        popoverPresentationController?.delegate = self
        self.sourceView = sourceView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        if let popOverController = popoverPresentationController {
            if let view = sourceView as? UIView {
                popOverController.sourceView = view.superview
                popOverController.sourceRect = view.frame
            } else if let item = sourceView as? UIBarButtonItem {
                popOverController.barButtonItem = item
            }
            
            popOverController.canOverlapSourceViewRect = false
            popOverController.passthroughViews = []
        }
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let contentHeight = tableView.contentSize.height
        preferredContentSize = CGSize(width: 320, height: contentHeight)
    }
    
    //MARK: Delegate Methods
    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sheetManager.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    override public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sheetManager.tableView(tableView, heightForRowAt: indexPath)
    }
 
    //MARK: Views and Constraints
    private func setupTableView() {
        tableView.dataSource = sheetManager
        tableView.backgroundColor = .adaptiveBackground
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.delegate = self
    }
    
}


extension AppActionSheetPopViewController: UIPopoverPresentationControllerDelegate {
    
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        if traitCollection.horizontalSizeClass == .compact {
            return .overFullScreen
        }
        return .none
    }
    
    public func presentationController(_ controller: UIPresentationController, viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        if style != .popover {
            let controller = AppActionSheetController()
            controller.setActionItems(actionItems)
            return controller
        }
        return nil
    }
    
}
