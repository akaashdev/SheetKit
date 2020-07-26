//
//  ViewController.swift
//  SheetKit
//
//  Created by Akaash Dev on 18/11/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit

public class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        alignViews()
    }
    
    func setupView() { }
    
    func setupSubviews() { }
    
    func setupConstraints() { }
    
    func alignViews() { }
}


public class ViewController: UIViewController {
    
    //MARK: Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        alignViews()
    }
    
    //MARK: Views and Constraints
    func setupViews() { }
    
    func setupConstraints() { }
    
    func alignViews() { }
    
}
