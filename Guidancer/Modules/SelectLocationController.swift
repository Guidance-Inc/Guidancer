//
//  SelectLocationController.swift
//  Guidancer
//
//  Created on 15.02.23.
//

import UIKit
import MapKit

protocol SelectLocationRouterDelegate: AnyObject {
    func didSelect(_ viewController: SelectLocationController)
}

class SelectLocationController: UIViewController, ViewControllerProtocol {
    var routerDelegate: SelectLocationRouterDelegate?
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        return map
    }()

    override func viewDidLoad() {
        configMap()
    }
    
    func configMap() {
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
