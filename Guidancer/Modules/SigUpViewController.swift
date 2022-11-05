//
//  SigUpViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol SingUpRouterDelegate: AnyObject {
    func didSelect(_ viewController: SigUpViewController)
}

class SigUpViewController: UIViewController, ViewControllerProtocol {
    
    var routerDelegate: SingUpRouterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sig-Up"
        view.backgroundColor = .yellow
    }
    
}
