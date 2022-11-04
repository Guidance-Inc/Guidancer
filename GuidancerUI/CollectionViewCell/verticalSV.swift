//
//  verticalSV.swift
//  Guidancer
//
//  Created by Артём Коротков on 03.11.2022.
//

import UIKit

class verticalSV: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // make UIView
    let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rest")!
        image.clipsToBounds = true
        image.layer.cornerRadius = 25.0
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return image
    }()
    
    
    let bestPlaceOfCityName: GLabel = {
        let label = GLabel(text: "Лучшие итальянские рестораны Санкт-Петербурга",
                           font: UIFont.systemFont(ofSize: 17, weight: .regular))
        label.textColor = .gBlack
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let descriptionOfPlace: GLabel = {
        let label = GLabel(text: "В этой прогулке я расскажу вам о лучших итальяннских ресторанах города СПб. Да, это не аудиопрогулка, но зато какой интересный рассказ...",
                           font: UIFont.systemFont(ofSize: 15, weight: .light))
        label.textColor = .gBlack
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup() {
        addArrangedSubview(imageView)
        addArrangedSubview(bestPlaceOfCityName)
        addArrangedSubview(descriptionOfPlace)
        
        NSLayoutConstraint.activate([
            descriptionOfPlace.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            bestPlaceOfCityName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
        
    }

}
