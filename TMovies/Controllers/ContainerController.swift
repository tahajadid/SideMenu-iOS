//
//  ContainerController.swift
//  TMovies
//
//  Created by Taha JADID on 22/2/2023.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var menuController: UIViewController!
    var centerController: UIViewController!
    var isExpanded = false

    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Hnadlers

    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = SideMenuViewController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controlle..")
        }
    }
    
    func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .transitionCurlUp , animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            },completion: nil)
        }
        else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .transitionCurlUp , animations: {
                self.centerController.view.frame.origin.x = 0
            },completion: nil)
        }
    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle() {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
    
}
