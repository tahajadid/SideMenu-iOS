//
//  SideMenuCell.swift
//  TMovies
//
//  Created by Taha JADID on 23/2/2023.
//

import UIKit

class SideMenuCell: UITableViewCell {

    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuIconImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        selectedView.layer.cornerRadius = 8

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func adaptBackground(_ isSelected: Bool) {
        if isSelected {
            selectedView.backgroundColor = UIColor(named: "menu_item_background")
            menuTitle.textColor = UIColor(named: "menu_item_color")
        } else {
            selectedView.backgroundColor = .black
            menuTitle.textColor = UIColor.white
        }
    }
    
}
