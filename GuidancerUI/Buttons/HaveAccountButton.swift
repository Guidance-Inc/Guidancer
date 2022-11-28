//
//  HaveAccountButton.swift
//  Guidancer
//
//  Created by Ибрагим Сахратулаев on 25.11.2022.
//

import UIKit

class HaveAccountButton: UIButton {
    
    override init (frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func attributedButton(_ firstPart: String,
                          _ secondPart: String) -> UIButton {
        
        let button = UIButton(type: .system)
        
        button.layer.shadowRadius  = 4
        button.layer.shadowColor   = UIColor.black.cgColor
        button.layer.shadowOffset  = CGSize(width: 0.0, height: 8.0)
        button.layer.shadowOpacity = 0.5
        button.layer.masksToBounds = false
        
        let attributeTitle         = NSMutableAttributedString(
            string: firstPart,
            attributes: [NSAttributedString.Key.font: UIFont.medium13, NSAttributedString.Key.foregroundColor: UIColor.gBlack])
        
        attributeTitle.append(NSAttributedString(
            string: secondPart,
            attributes: [NSAttributedString.Key.font: UIFont.medium13, NSAttributedString.Key.foregroundColor: UIColor.gYellowGreen]))
        
        button.setAttributedTitle(attributeTitle, for: .normal)
        
        return button
        
    }
    
    
}
