//
//  CustomButton.swift
//  Guidancer
//
//  Created by David Krasnov on 04.11.22.
//

import UIKit

class CustomButton: GButton {
    
    init(title: String,
         frame: CGRect = .zero,
         didTap: ((UIButton) -> Void)? = nil,
         image: UIImage?,
         configuration: UIButton.Configuration
    ) {
        self.title = title
        self.image = image
        self.config = configuration
        super.init(frame: frame, didTap: didTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title: String
    let image: UIImage?
    let config: UIButton.Configuration
    
    override func configureUI() {
        print("petux")
        super.configureUI()
        print("krasava")
        backgroundColor = .black
        setTitle(title, for: .normal)
        setImage(image, for: .normal)
        layer.cornerRadius = 16
        
    }
    
}
