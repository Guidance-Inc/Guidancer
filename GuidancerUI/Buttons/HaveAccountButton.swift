//
//  HaveAccountButton.swift
//  Guidancer
//
//  Created by Ибрагим Сахратулаев on 25.11.2022.
//

import UIKit

class HaveAccountButton : GButton {
    
    let firstPart: String
    let secondPart: String
    
    init(firstPart: String,
         secondPart: String,
         frame: CGRect = .zero,
        
         didTap: ((UIButton) -> Void)? = nil
    ){
        self.firstPart = firstPart
        self.secondPart = secondPart
        super.init(frame: frame, didTap: didTap)
    }
    override func configureUI() {
        super.configureUI()
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 8.0)
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        
        let attributeTitle = NSMutableAttributedString(
            string: firstPart,
            attributes: [NSAttributedString.Key.font: UIFont.medium13,
                         NSAttributedString.Key.foregroundColor: UIColor.gBlack as Any])
        attributeTitle.append(NSAttributedString(
            string: secondPart,
            attributes: [NSAttributedString.Key.font: UIFont.medium13,
                         NSAttributedString.Key.foregroundColor: UIColor.systemYellow as Any]))
        self.setAttributedTitle(attributeTitle, for: .normal)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
