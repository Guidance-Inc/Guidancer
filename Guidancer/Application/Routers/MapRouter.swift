//
//  MapRouter.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol MapRouterProtocol: RouterProtocol {
    func pushUserProfileViewController()
    func popMapViewController()
}

class MapRouter: MapRouterProtocol {
    
    init(builder: BuilderProtocol) {
        self.builder = builder
    }
    
    var navigationController: UINavigationController!
    let builder: BuilderProtocol
    
    func pushUserProfileViewController() {
        let viewController = builder.createUserProfileVC(router: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func popMapViewController() {
        navigationController.popViewController(animated: true)
    }
    
}

extension MapRouter: MapRouterDelegate {
    
    func didSelect(_ viewController: MapViewController) {
        pushUserProfileViewController()
    }
    
}

extension MapRouter: UserProfileRouterDelegate {
    
    func didSelect(_ viewController: UserProfileViewController) {
        popMapViewController()
    }
    
}
