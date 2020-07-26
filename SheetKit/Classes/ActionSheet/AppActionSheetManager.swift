//
//  AppActionSheetManager.swift
//  SheetKit
//
//  Created by Akaash Dev on 04/11/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit

public class AppActionSheetManager: NSObject, UITableViewDataSource, UITableViewDelegate {

    //MARK: Properties
    public weak var controller: AppActionSheetControllerProtocol?
    
    private (set) public var actionItems: [AppActionItemProtocol] = []
    private let ignoresCancelButton: Bool
    
    //MARK: Initializers
    public init(actionSheetController controller: AppActionSheetControllerProtocol, ignoresCancelButton: Bool) {
        self.controller = controller
        self.ignoresCancelButton = ignoresCancelButton
    }
    
    //MARK: Methods
    public func setActionItems(_ items: [AppActionItemProtocol]) {
        actionItems = items
    }
    
    public func addActionItem(_ item: AppActionItem) {
        actionItems.append(item)
    }
    
    public func addCustomCellItem(_ item: CustomAppActionItem) {
        actionItems.append(item)
    }
    
    public func addASeparator() {
        actionItems.append(AppActionItem(type: .separator))
    }
    
    public func addCancelButton() {
        actionItems.append(AppActionItem(type: .cancelButton))
    }
    
    public func addTitle(_ title: String) {
        let item = AppActionItem(type: .title, title: title)
        if actionItems.isEmpty {
            actionItems.append(item)
            return
        }
        actionItems.insert(item, at: 0)
    }
    
    //MARK: Tableview datasource
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ignoresCancelButton {
            let withoutCancel = actionItems.filter { $0.type != .cancelButton }
            return withoutCancel.count
        }
        return actionItems.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let actionItem = actionItems[indexPath.row]
        switch actionItem.type {
        case .button, .destructiveButton:
            let cell = AppActionButtonCell()
            cell.setupCell(actionItem: actionItem)
            return cell
            
        case .header:
            let cell = AppActionHeaderCell()
            cell.setupCell(actionItem: actionItem)
            return cell
            
        case .separator:
            return AppActionSeperatorCell()
            
        case .cancelButton:
            return AppActionCancelButtonCell()
            
        case .title:
            let cell = AppActionTitleCell()
            cell.setupCell(actionItem: actionItem)
            return cell
            
        case .custom(_):
            let cell = AppActionCustomCell()
            if let customAction = actionItem as? CustomAppActionItem {
                customAction.viewHandler(cell.contentView)
                cell.layoutIfNeeded()
            }
            return cell
        }
    }
    
    //MARK: Tableview Delegates
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = actionItems[indexPath.row].type
        if ignoresCancelButton {
            return type == .cancelButton ? 0 : type.rowHeight
        }
        return type.rowHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let cell = tableView.cellForRow(at: indexPath)
        if cell is AppActionTitleCell ||
            cell is AppActionHeaderCell ||
            cell is AppActionCustomCell
        { return }
        
        controller?.dismiss(
            animated: true,
            completion: {
                let actionItem = self.actionItems[indexPath.row]
                actionItem.handler?(actionItem)
            }
        )
        
    }
    
}


public protocol AppActionSheetControllerProtocol where Self: UIViewController {
    var sheetManager: AppActionSheetManager { get }
    var actionItems: [AppActionItemProtocol] { get }
    func setActionItems(_ items: [AppActionItemProtocol])
    func addActionItem(_ item: AppActionItem)
    func addCustomCellItem(_ item: CustomAppActionItem)
    func addASeparator()
    func addCancelButton()
    func addTitle(_ title: String)
}

public extension AppActionSheetControllerProtocol {
    
    var actionItems: [AppActionItemProtocol] {
        return sheetManager.actionItems
    }
    
    func setActionItems(_ items: [AppActionItemProtocol]) {
        sheetManager.setActionItems(items)
    }
    
    func addActionItem(_ item: AppActionItem) {
        sheetManager.addActionItem(item)
    }
    
    func addCustomCellItem(_ item: CustomAppActionItem) {
        sheetManager.addCustomCellItem(item)
    }
    
    func addASeparator() {
        sheetManager.addASeparator()
    }
    
    func addCancelButton() {
        sheetManager.addCancelButton()
    }
    
    func addTitle(_ title: String) {
        sheetManager.addTitle(title)
    }
    
}
