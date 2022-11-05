//
//  GLabel.swift
//  Guidancer
//
//  Created by Vladimir Berezin on 02.11.22.
//

import UIKit

class GLabel: UILabel {
    
    init(text: String,
         font: UIFont,
         fontColor: UIColor? = .gBlack,
         numberOfLines: Int = 0,
         frame: CGRect = .zero
    ) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
