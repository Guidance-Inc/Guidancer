//
//  horizontalSV.swift
//  Guidancer
//
//  Created by Артём Коротков on 03.11.2022.
//

import UIKit

class horizontalSV: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let whoAndWhenPost: GLabel = {
        let label = GLabel(text: "Feliks Omarov 2 дня назад",
                           font: UIFont.systemFont(ofSize: 12, weight: .light))
        label.textColor = UIColor.gGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let likesNumber: GLabel = {
        let label = GLabel(text: "228",
                           font: UIFont.systemFont(ofSize: 12, weight: .regular))
        label.textColor = .gBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let commentNumber: GLabel = {
        let label = GLabel(text: "228",
                           font: UIFont.systemFont(ofSize: 12, weight: .regular))
        label.textColor = .gBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let heartImage: GLikeCommentButton = {
        let image = GLikeCommentButton(systemNameImage: "heart")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let commentImage: GLikeCommentButton = {
        let image = GLikeCommentButton(systemNameImage: "text.bubble")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setup() {
        addArrangedSubview(whoAndWhenPost)
        addArrangedSubview(likesNumber)
        addArrangedSubview(heartImage)
        addArrangedSubview(commentNumber)
        addArrangedSubview(commentImage)
    }
}


extension UILabel {
    convenience init(font: UIFont, text: String, textColor: UIColor) {
        self.init()
        self.font = font
        self.text = text
        self.textColor = textColor
    }
}

