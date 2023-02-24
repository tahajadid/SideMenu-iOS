//
//  SideMenuViewController.swift
//  TMovies
//
//  Created by Taha JADID on 23/2/2023.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    var menuList: [MenuOptionItem] = Constants.menuList
    
    private let reuseIdentifier = "SideMenuCell"
    var delegate: HomeControllerDelegate?

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var menuOptionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMenuTable()
        configureUI()
    }
    
    func configureUI(){
        logoutView.layer.cornerRadius = 8

        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }
    
    func configureMenuTable(){
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
        cell.menuTitle.text = self.menuList[indexPath.row].title
        cell.menuIconImage.image = UIImage(named: self.menuList[indexPath.row].image ?? "settings")
        cell.adaptBackground(self.menuList[indexPath.row].isSelected!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click on ",self.menuList[indexPath.row])
        delegate?.handleMenuToggle(forMenuOptiom: self.menuList[indexPath.row])
        self.setSelectedItem(self.menuList[indexPath.row])
        self.menuOptionTableView.reloadData()
    }
    
    func setSelectedItem(_ menuOptionItem: MenuOptionItem) {
        for item in self.menuList {
            if(menuOptionItem.id == item.id){
                self.menuList[item.id!].isSelected = true
            }else {
                self.menuList[item.id!].isSelected = false
            }
            
        }
    }
}
