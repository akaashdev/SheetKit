//
//  MainViewController.swift
//  ADActionSheet
//
//  Created by Akaash Dev on 03/10/19.
//  Copyright © 2019 Akaash Dev. All rights reserved.
//

import UIKit
import SheetKit

class MainViewController: ViewController {
    
    private let wallpapers = [
        "wallpaper-1",
        "wallpaper-2",
        "wallpaper-3",
        "wallpaper-4",
        "wallpaper-5",
        "wallpaper-6"
    ]
    
    private lazy var wallpaperImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.image = UIImage(named: "wallpaper-5")
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.image = UIImage(named: "friends-logo")
        view.setDimensions(width: 240, height: 200)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 24
        return view
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        if #available(iOS 13.0, *) {
            let effect = UIBlurEffect(style: .systemUltraThinMaterial)
            let view = UIVisualEffectView(effect: effect)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        } else {
            let effect = UIBlurEffect(style: .light)
            let view = UIVisualEffectView(effect: effect)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }
    }()
    
    private lazy var aboutButton: AppButton = {
        let view = AppButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.button.setTitle("About Friends", for: .normal)
        view.button.addTarget(self, action: #selector(handlePreviewOpenAction), for: .touchUpInside)
        return view
    }()
    
    private lazy var castButton: AppButton = {
        let view = AppButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.button.setTitle("Cast and Crew", for: .normal)
        view.button.addTarget(self, action: #selector(handlePreviewTableViewOpenAction), for: .touchUpInside)
        return view
    }()
    
    private lazy var settingsButton: AppButton = {
        let view = AppButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentPadding = 10
        let image = UIImage(named: "settings")?.withRenderingMode(.alwaysTemplate)
        view.button.setImage(image, for: .normal)
        view.button.tintColor = .labelColor
        view.button.addTarget(self, action: #selector(handleSheetOpenAction), for: .touchUpInside)
        view.setDimensions(width: 44, height: 44)
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(wallpaperImageView)
        view.addSubview(blurView)
        view.addSubview(stackView)
        view.addSubview(settingsButton)
        
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(aboutButton)
        stackView.addArrangedSubview(castButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        wallpaperImageView.fillSuperView(safeLayout: false)
        blurView.fillSuperView(safeLayout: false)
        
        settingsButton.safeTrailingAnchor(padding: -16)
        settingsButton.safeTopAnchor(padding: 16)
        
        stackView.fillSuperViewWidth(padding: 24)
        stackView.alignCenter()
    }
    
    var currentIndex = 5
    @objc private func handleChangeBackgroundAction() {
        currentIndex = (currentIndex + 1) % wallpapers.count
        wallpaperImageView.image = UIImage(named: wallpapers[currentIndex])
    }
    
    @available(iOS 13.0, *)
    @objc private func handleToggleThemeAction() {
        let newInterface: UIUserInterfaceStyle = traitCollection.userInterfaceStyle == .dark ? .light : .dark
        UIView.transition(with: view,
                          duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: { self.view.window?.overrideUserInterfaceStyle = newInterface })
    }
    
    @objc private func handlePreviewOpenAction() {
        let controller = PreviewViewController()
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "About"
        label.font = Font.ofSize(30).heavy
        controller.previewView.headerView.addSubview(label)
        controller.previewView.headerHeight = 60
        label.anchorBottom()
        label.anchorTop(padding: 12)
        label.fillSuperViewWidth(padding: 12)
        
        let infoView = FriendsInfoView()
        infoView.translatesAutoresizingMaskIntoConstraints = false
        controller.contentView.addSubview(infoView)
        infoView.fillSuperView()
        
        controller.initialPosition = .collapsed
        present(controller, animated: true)
    }
    
    let dataSource = FriendsCastDataSource()
    
    @objc private func handlePreviewTableViewOpenAction() {
        let controller = PreviewTableViewController()
        controller.minimumPreviewHeight = .absolute(100)
        controller.preferredPreviewHeight = .fractional(0.54)
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cast"
        label.font = Font.ofSize(30).heavy
        controller.previewView.headerView.addSubview(label)
        controller.previewView.headerHeight = 60
        label.anchorBottom()
        label.anchorTop(padding: 12)
        label.fillSuperViewWidth(padding: 12)
        
        dataSource.registerCellTypes(in: controller.tableView)
        controller.tableView.dataSource = dataSource
        controller.tableView.rowHeight = 64
        controller.tableView.allowsSelection = false
        present(controller, animated: true)
    }
    
    @objc private func handleSheetOpenAction() {
        let controller = AppActionSheetPopViewController(sourceView: settingsButton)
        controller.addTitle("Menu")
        
        let item1 = AppActionItem(type: .button,
                                  title: "Change Background",
                                  image: UIImage(named: "action-button-wallpaper"),
                                  handler: { _ in self.handleChangeBackgroundAction() })
        
        let item3 = AppActionItem(type: .button,
                                  title: "Joey doesn't share food!",
                                  image: UIImage(named: "action-button-share"),
                                  imageTintColor: .flatOrange)
        
        let item4 = AppActionItem(type: .button,
                                  title: "We were on a break!",
                                  image: UIImage(named: "action-button-break"),
                                  imageTintColor: .flatBlue)
        
        let item5 = AppActionItem(type: .destructiveButton,
                                  title: "Delete Background",
                                  image: UIImage(named: "action-button-delete"),
                                  handler: { _ in self.wallpaperImageView.image = nil })
        
        if #available(iOS 13.0, *) {
            let item2 = AppActionItem(type: .button,
            title: "Toggle Theme",
            image: UIImage(named: "action-button-theme"),
            handler: { _ in self.handleToggleThemeAction() })
            
            [item1, item2, item3, item4, item5].forEach { controller.addActionItem($0) }
        } else {
            [item1, item3, item4, item5].forEach { controller.addActionItem($0) }
        }
        
        controller.addCancelButton()
        present(controller, animated: true)
    }

}


//typealias CompletionBlock = (()->())?
//
//extension UIViewController {
//
//    func presentActionSheetController(_ controller: AppActionSheetPopViewController, sourceView: PopOverSourceView, animated: Bool = true, completion: CompletionBlock = nil) {
//
//        guard let popOverController = controller.popoverPresentationController else {
//            present(
//                controller,
//                animated: animated,
//                completion: completion
//            )
//            return
//        }
//
//        if let view = sourceView as? UIView {
//            popOverController.sourceView = view.superview
//            popOverController.sourceRect = view.frame
//        } else if let item = sourceView as? UIBarButtonItem {
//            popOverController.barButtonItem = item
//        }
//
//        popOverController.canOverlapSourceViewRect = false
//        popOverController.passthroughViews = []
//        present(
//            controller,
//            animated: animated,
//            completion: completion
//        )
//    }
//
//}
