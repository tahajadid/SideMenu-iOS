//
//  DashboardController.swift
//  TMovies
//
//  Created by Taha JADID on 24/2/2023.
//

import UIKit

class DashboardController: UIViewController {

    @IBOutlet weak var leftView: UIView!
    var delegate: HomeControllerDelegate?

    @IBOutlet weak var mainNavigationBar: UINavigationBar!
    @IBOutlet weak var menuIcon: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "screen_background")
        configureNavigationBar()
        
        // Add listener to flashView
        let gestureLeft = UITapGestureRecognizer(target: self, action:
        #selector(handleMenuToogle))
        self.leftView.addGestureRecognizer(gestureLeft)
    }
    
    /**
        Hide the default Nav bar
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    
    @IBAction func handlemenuClick(_ sender: Any) {
        delegate?.handleMenuToggle(forMenuOptiom: MenuOptionItem(
            id: 0,
            title: "Home",
            image: "home",
            isSelected: true
        ))
        print("Toogle menu(DashboardController)..")
    }
    
    @objc func handleMenuToogle() {
        delegate?.handleMenuToggle(forMenuOptiom: MenuOptionItem(
            id: 0,
            title: "Home",
            image: "home",
            isSelected: true
        ))
        print("Toogle menu(DashboardController)..")
    }
    
    func configureNavigationBar() {
        
        mainNavigationBar.barStyle = .default
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "primary_color")]
        mainNavigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        
    }
    

}
