//
//  GLikeCommentButton.swift
//  Guidancer
//
//  Created by Артём Коротков on 04.11.2022.
//

import UIKit

class GLikeCommentButton: GButton {
    
    private let icon: UIImage?
    
    init(icon: UIImage?,
         frame: CGRect = .zero,
         didTap: ((UIButton) -> Void)? = nil
    ) {
        self.icon = icon
        super.init(frame: frame, didTap: didTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        super.configureUI()
        tintColor = .gBlack
        imageView?.image = icon
    }
    
}
