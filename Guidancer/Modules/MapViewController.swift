//
//  MapViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 04.11.22.
//

import UIKit

protocol MapRouterDelegate: AnyObject {
    func didSelect(_ viewController: MapViewController)
}

class MapViewController: UIViewController, ViewControllerProtocol {
    
    var routerDelegate: MapRouterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Map"
        view.backgroundColor = .green
        let button = GRectangleButton(title: "Next") { [ weak self ] _ in
            guard let self = self else { return }
            self.routerDelegate?.didSelect(self)
        }
        button.putOnCenter(to: view, height: 50, width: 200)
    }
    
}
