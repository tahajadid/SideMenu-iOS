//
//  SideMenuViewController.swift
//  TMovies
//
//  Created by Taha JADID on 23/2/2023.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    private let reuseIdentifier = "SideMenuCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var menuOptionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        // Do any additional setup after loading the view.
        
        menuOptionTableView.dataSource = self
        menuOptionTableView.delegate = self
        
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        menuOptionTableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }

}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SideMenuCell
        return cell
    }
    
    
}
