//
//  ViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 01.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gYellow
        let button = GRectangleButton(title: "Done") { button in
            button.backgroundColor = .gYellow
            print("button tapped")
        }
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.titleLabel?.font = FontFamily.Montserrat.extraBold.font(size: 18.0)
        view.addSubview(button)
    }
    
}
