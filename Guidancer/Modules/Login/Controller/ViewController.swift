//
//  ViewController.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 01.11.22.
//

import UIKit
import GuidancerUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let button = GRectangleButton(title: "Done", didTap: burfsdf)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        view.addSubview(button)
    }
    
    
    func burfsdf(sender: GRectangleButton) {
        
    }
}
