//
//  ProfileController.swift
//  TMovies
//
//  Created by Taha JADID on 24/2/2023.
//

import UIKit

class ProfileController: UIViewController {
    var delegate: HomeControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()

        // Do any additional setup after loading the view.
    }

    @objc func handleMenuToogle() {
        delegate?.handleMenuToggle(forMenuOptiom: MenuOptionItem(
            id: 0,
            title: "Home",
            image: "home",
            isSelected: true
        ))
        print("Toogle menu (ProfileController)..")
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.barStyle = .default
        
        navigationItem.title = "T-Movies"
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor(named: "primary_color")]
        navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToogle))
        
    }

}
