//
//  ProfileController.swift
//  TMovies
//
//  Created by Taha JADID on 24/2/2023.
//

import UIKit

class ProfileController: UIViewController {

    
    @IBOutlet weak var centerText: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonClick(_ sender: UIButton) {
        let containerController = ContainerController()
        containerController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        containerController.modalPresentationStyle = .overFullScreen //or .overFullScreen for transparency
        self.present(containerController,animated: false,completion: nil)
    }
    
    
}
