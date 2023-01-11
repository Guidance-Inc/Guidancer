//
//  GuestProfileViewController.swift
//  Guidancer
//
//  Created by Артём Коротков on 13.12.2022.
//

import UIKit

class GuestProfileViewController: MyProfileViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideButton()
        
    }
    
    override func setupSettingsItemBar() {
        super.setupSettingsItemBar()
        var arrowItem = UIBarButtonItem()
        arrowItem = UIBarButtonItem(image: UIImage(named: "Arrow4"),
                                       landscapeImagePhone: .none,
                                       style: .done,
                                       target: self,
                                       action: #selector(settingActionItemBar))
        arrowItem.tintColor = .black
        navigationItem.leftBarButtonItem = arrowItem
    }
    
    func overrideButton() {
        followButton.setTitle("follow", for: .normal)
        followButton.setTitleColor(UIColor(named: "green"), for: .normal)
        followButton.layer.borderColor = CGColor(red: 31/255, green: 157/255, blue: 0, alpha: 1)
    }

}
