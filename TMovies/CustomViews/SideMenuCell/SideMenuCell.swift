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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
