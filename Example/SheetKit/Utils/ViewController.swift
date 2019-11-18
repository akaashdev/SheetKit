//
//  ViewController.swift
//  ADActionSheet
//
//  Created by Akaash Dev on 18/11/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit

class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        alignViews()
    }
    
    func setupView() { }
    
    func setupSubviews() { }
    
    func setupConstraints() { }
    
    func alignViews() { }
}


class ViewController: UIViewController {
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        alignViews()
    }
    
    //MARK: Views and Constraints
    func setupViews() { }
    
    func setupConstraints() { }
    
    func alignViews() { }
    
}
