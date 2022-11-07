//
//  GRectangleButton.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 01.11.22.
//

import UIKit

class GRectangleButton: GButton {
    
    init(title: String,
         image: UIImage? = nil,
         frame: CGRect = .zero,
         didTap: ((UIButton) -> Void)? = nil
    ) {
        self.title = title
        self.image = image
        super.init(frame: frame, didTap: didTap)
    }
    
    let image: UIImage?
    let title: String
    let color: UIColor? = .gBlack
    
    override func configureUI() {
        super.configureUI()
        setSize(width: 302, height: 52)
        backgroundColor = color
        setTitle(title, for: .normal)
        layer.cornerRadius = 16
        if image != nil {
            setImage(image, for: .normal)
            var configuration = UIButton.Configuration.filled()
            configuration.imagePadding = 10
            configuration.baseBackgroundColor = color
            self.configuration = configuration
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
