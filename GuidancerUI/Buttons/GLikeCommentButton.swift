//
//  GLikeCommentButton.swift
//  Guidancer
//
//  Created by Артём Коротков on 04.11.2022.
//

import UIKit

class GLikeCommentButton: GButton {
    
    let systemNameImage: String
    
    init(systemNameImage: String,
         frame: CGRect = .zero,
         didTap: ((UIButton) -> Void)? = nil
    ) {
        self.systemNameImage = systemNameImage
        super.init(frame: frame, didTap: didTap)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureUI() {
        imageView?.image = UIImage(systemName: systemNameImage)
    }
    
}
