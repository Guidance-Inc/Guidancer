//
//  PostCollectionViewCell.swift
//  Guidancer
//
//  Created by Артём Коротков on 20.11.2022.
//

import UIKit

class PostCollectionViewCell: GCollectionViewCell {
    
    private let informationInPost = DescriptionPostSV()
    let contentStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        cornerAndShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        contentStackView.addArrangedSubview(informationInPost)
        contentStackView.axis = .vertical
        contentStackView.embed(in: contentView)
    }
    
    private func cornerAndShadow() {
        self.layer.cornerRadius = 25
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 7
        self.layer.shadowColor = UIColor.gBlack?.cgColor
    }
    
    func setupContent(post: GPost) {
        informationInPost.setupContent(image: post.image,
                                       bestPlaceOfCityName: post.name,
                                       descriptionOfPlace: post.descriptionOfPlace)
    }
    
    private final class DescriptionPostSV: UIStackView {

        var imageView: UIImageView = {
            let image = UIImageView()
            image.clipsToBounds = true
            image.layer.cornerRadius = 25.0
            image.translatesAutoresizingMaskIntoConstraints = false
            image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            return image
        }()
        
        let bestPlaceOfCityName = GLabel(font: UIFont.systemFont(ofSize: 17, weight: .regular))
        
        let descriptionOfPlace = GLabel(font: UIFont.systemFont(ofSize: 15, weight: .light))
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setup() {
            spacing = 5
            distribution = .equalCentering
            axis = .vertical
            alignment = .firstBaseline
            addArrangedSubview(imageView)
            addArrangedSubview(bestPlaceOfCityName)
            addArrangedSubview(descriptionOfPlace)
            NSLayoutConstraint.activate([
                descriptionOfPlace.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                bestPlaceOfCityName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            ])
        }
        
        func setupContent(image: UIImage?,
                          bestPlaceOfCityName: String,
                          descriptionOfPlace: String
        ) {
            self.imageView.image = image
            self.bestPlaceOfCityName.text = bestPlaceOfCityName
            self.descriptionOfPlace.text = descriptionOfPlace
        }
    }
    
}
