//
//  ContainerController.swift
//  TMovies
//
//  Created by Taha JADID on 22/2/2023.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    
    var menuController: SideMenuViewController!
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
        let dashboardController = DashboardController()
        dashboardController.delegate = self
        centerController = UINavigationController(rootViewController: dashboardController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    

    func configureMenuController() {
        if menuController == nil {
            menuController = SideMenuViewController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Did add menu controlle..")
        }
    }
    
    func showMenuController(shouldExpand: Bool, menuOptionItem: MenuOptionItem) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .transitionCurlUp , animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            },completion: nil)
        }
        else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .transitionCurlUp , animations: {
                self.centerController.view.frame.origin.x = 0
            },completion: nil)
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0,options: .curveEaseInOut , animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                self.didSelectMenuOption(menuOptionItem: menuOptionItem)
                
            }
                
        }
    }
    
    func didSelectMenuOption(menuOptionItem: MenuOptionItem) {
        switch(menuOptionItem.title){
            case "Home" :
                print("Home Click")
            
            case "Profile" :
            navigateToDestination("Profile")
            print("Profile Click")
            
            case "Settings" :
            navigateToDestination("Settings")
                print("Settings Click")
            
            case "Security" :
            navigateToDestination("Security")
                print("Security Click")
            default:
            print("Other")
        }
    }
    
    /*
        Navigate to the destination
     */
    func navigateToDestination(_ title: String) {
        
        let profileController = ProfileController()
        profileController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        profileController.modalPresentationStyle = .overFullScreen //or .overFullScreen for transparency
        self.present(profileController,animated: true,completion: nil)
        profileController.centerText?.text = title

    }
}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOptiom menuOptionItem: MenuOptionItem) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded, menuOptionItem: menuOptionItem)
    }
    
}
