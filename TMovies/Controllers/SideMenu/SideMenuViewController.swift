//
//  SideMenuViewController.swift
//  TMovies
//
//  Created by Taha JADID on 23/2/2023.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var menuOptionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }

}
