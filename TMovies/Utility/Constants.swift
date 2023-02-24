//
//  Constants.swift
//  TMovies
//
//  Created by Taha JADID on 23/2/2023.
//

import Foundation
import UIKit

class Constants {
    
    static var menuList: [MenuOptionItem] = [
        MenuOptionItem(
            id: 0,
            title: "Home",
            image: "home",
            isSelected: true
        ),
        MenuOptionItem(
            id: 1,
            title: "Profile",
            image: "user",
            isSelected: false
        ),
        MenuOptionItem(
            id: 2,
            title: "Settings",
            image: "settings",
            isSelected: false
        ),
        MenuOptionItem(
            id: 3,
            title: "Security",
            image: "secure",
            isSelected: false
        )]
    
}
