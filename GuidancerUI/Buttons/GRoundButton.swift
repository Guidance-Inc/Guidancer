//
//  GRoundButton.swift
//  Guidancer
//
//  Created by David Krasnov on 26.11.22.
//

import UIKit

enum ButtonSize {
    case small
    case big
}
    
enum ButtonColor {
    case black
    case white
}

class GRoundButton: GButton {
    
    init(image: UIImage? = nil,
         frame: CGRect = .zero,
         color: ButtonColor,
         size: ButtonSize,
         didTap: ((UIButton) -> Void)? = nil
    ) {
        self.image = image
        self.colorType = color
        self.size = size
        super.init(frame: frame, didTap: didTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImage?
    let colorType: ButtonColor
    let size: ButtonSize
    
    var sizeButton: CGFloat {
        switch size {
        case .small:
            return 54
        case .big:
            return 67
        }
    }
    
    var background: UIColor {
        switch colorType {
        case .white:
            return .white
        case .black:
            return .black
        }
    }
    
    var tint: UIColor {
        switch colorType {
        case .white:
            return .black
        case .black:
            return .white
        }
    }
    
    override func configureUI() {
        super.configureUI()
        
        setSize(width: sizeButton, height: sizeButton)
        layer.cornerRadius = sizeButton / 2
        backgroundColor = background
        tintColor = tint
        
        if colorType == .white {
            layer.borderColor = UIColor.black.cgColor
            layer.borderWidth = 1
        }
        
        setImage(image, for: .normal)
    }
}

