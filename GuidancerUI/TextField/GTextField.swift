//
//  GTextField.swift
//  Guidancer
//
//  Created by Ибрагим Сахратулаев on 03.11.2022.
//

import UIKit

class GTextField: UITextField {
    
    init(text: String, font: UIFont,
         frame: CGRect = .zero) {
        
        super.init(frame: frame)
        
        self.placeholder = text
        self.textColor = .black
        self.font = font
        self.attributedPlaceholder = NSAttributedString(
            string: text,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
