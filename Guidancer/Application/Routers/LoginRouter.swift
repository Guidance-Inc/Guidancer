//
//  LoginRouter.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController! { get set }
}

protocol LoginRouterProtocol: RouterProtocol {
    func pushSighUpViewController()
    func popLoginViewController()
}

class LoginRouter: LoginRouterProtocol {
    
    init(builder: BuilderProtocol) {
        self.builder = builder
    }
    
    var navigationController: UINavigationController!
    let builder: BuilderProtocol
    
    func pushSighUpViewController() {
        let viewController = builder.createSignUpVC(router: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func popLoginViewController() {
        navigationController.popViewController(animated: true)
    }
    
}

extension LoginRouter: LoginRouterDelegate {
    
    func didSelect(_ controller: LoginViewController) {
        pushSighUpViewController()
    }
    
}

extension LoginRouter: SingUpRouterDelegate {
    
    func didSelect(_ viewController: SigUpViewController) {
       popLoginViewController()
    }
    
}
