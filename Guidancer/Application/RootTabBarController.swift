//
//  RootTabBarController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

class RootTabBarController: UITabBarController {
    
    init(builder: BuilderProtocol,
         nibName: String? = nil,
         bundle: Bundle? = nil
    ) {
        self.builder = builder
        loginRouter = LoginRouter(builder: builder)
        mapRouter = MapRouter(builder: builder)
        super.init(nibName: nibName, bundle: bundle)
        setupViewControllers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let builder: BuilderProtocol
    private var loginRouter: LoginRouterProtocol
    private var mapRouter: MapRouterProtocol
    
    private func createLoginNavigationController() -> UINavigationController {
        let loginViewController = builder.createLoginVC(router: loginRouter)
        let loginNavigationController = UINavigationController(rootViewController: loginViewController)
        loginRouter.navigationController = loginNavigationController
        return loginNavigationController
    }
    
    private func createMapNavigationController() -> UINavigationController {
        let mapViewController = builder.createuserMapVC(router: mapRouter)
        let mapNavigationController = UINavigationController(rootViewController: mapViewController)
        mapRouter.navigationController = mapNavigationController
        return mapNavigationController
    }
    
    private func setupViewControllers() {
        let loginNavigationController = createLoginNavigationController()
        let mapNavigationController = createMapNavigationController()
        viewControllers = [loginNavigationController, mapNavigationController]
    }
    
    
}
