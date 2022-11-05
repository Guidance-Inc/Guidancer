//
//  LoginViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol LoginRouterDelegate: AnyObject {
    func didSelect(_ controller: LoginViewController)
}

class LoginViewController: UIViewController, ViewControllerProtocol {
    
    var routerDelegate: LoginRouterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Login"
        let button = GRectangleButton(title: "Next") { [ weak self ] _ in
            guard let self = self else { return }
            self.routerDelegate?.didSelect(self)
        }
        button.putOnCenter(to: view, height: 50, width: 200)
    }
    
}
