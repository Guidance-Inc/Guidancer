//
//  GRectangleButton.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 01.11.22.
//

import UIKit

class GRectangleButton: GButton {
    
    init(title: String,
         frame: CGRect = .zero,
         didTap: ((UIButton) -> Void)? = nil
    ) {
        self.title = title
        super.init(didTap: didTap, frame: frame)
    }
    
    let title: String
    
    override func configureUI() {
        backgroundColor = .gBlack
        setTitle(title, for: .normal)
        layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
