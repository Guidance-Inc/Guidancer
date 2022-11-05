//
//  UserProfileViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol UserProfileRouterDelegate: AnyObject {
    func didSelect(_ viewController: UserProfileViewController)
}

class UserProfileViewController: UIViewController, ViewControllerProtocol {
    
    var routerDelegate: UserProfileRouterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Profile"
        view.backgroundColor = .cyan
    }
    
}
