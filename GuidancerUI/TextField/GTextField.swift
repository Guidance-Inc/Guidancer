//
//  GTextField.swift
//  Guidancer
//
//  Created by Ибрагим Сахратулаев on 25.11.2022.
//

import UIKit

class GTextField: UITextField {
    
    init(placeholder: String,
         font: UIFont,
         frame: CGRect = .zero) {
        
        super.init(frame: frame)
        
        self.placeholder           = placeholder
        self.textColor             = .black
        self.font                  = font
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
    }
    
    required init(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
