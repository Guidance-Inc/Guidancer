//
//  Builder.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import Foundation

protocol BuilderProtocol {
    func createLoginVC(router: RouterProtocol) -> LoginViewController
    func createSignUpVC(router: RouterProtocol) -> SigUpViewController
    func createuserMapVC(router: RouterProtocol) -> MapViewController
    func createUserProfileVC(router: RouterProtocol) -> UserProfileViewController
}

protocol ViewControllerProtocol {
    associatedtype RouterDelegate
    var routerDelegate: RouterDelegate? { get set }
    init()
}

class Builder: BuilderProtocol {
    
    func createViewController<Controller: ViewControllerProtocol>(router: RouterProtocol) -> Controller {
        var viewController = Controller()
        viewController.routerDelegate = router as? Controller.RouterDelegate
        return viewController
    }
    
    func createLoginVC(router: RouterProtocol) -> LoginViewController {
        return createViewController(router: router)
    }
    
    func createSignUpVC(router: RouterProtocol) -> SigUpViewController {
        return createViewController(router: router)
    }
    
    func createuserMapVC(router: RouterProtocol) -> MapViewController {
        createViewController(router: router)
    }
    
    func createUserProfileVC(router: RouterProtocol) -> UserProfileViewController {
        createViewController(router: router)
    }
    
}
