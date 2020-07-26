//
//  PreviewTableViewController.swift
//  SheetKit
//
//  Created by Akaash Dev on 28/12/18.
//  Copyright © 2018 Akaash Dev. All rights reserved.
//

import UIKit

public class PreviewTableViewController: PreviewViewController, UITableViewDataSource {
    
    public var tableView: UITableView {
        return previewTableView.tableView
    }
    
    private var _previewTableView: PreviewTableView?
    private var previewTableView: PreviewTableView {
        get {
            guard let tableView = _previewTableView else {
                let view = PreviewTableView()
                view.translatesAutoresizingMaskIntoConstraints = false
                view.addGestureRecognizer(panGestureRecognizer)
                view.tableView.dataSource = self
                _previewTableView = view
                return view
            }
            return tableView
        }
        set {
            _previewTableView = newValue
            previewView = _previewTableView!
        }
    }
    
    override public var previewView: PreviewView {
        get { return previewTableView }
        set {
            guard let tableView = newValue as? PreviewTableView else {
                assert(false, "Can only set PreviewTableView to previewView property of PreviewTableViewController. Aborting set action")
                return
            }
            previewTableView = tableView
        }
    }
    
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
