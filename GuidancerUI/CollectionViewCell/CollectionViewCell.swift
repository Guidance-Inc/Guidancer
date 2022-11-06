//
//  CollectionViewCell.swift
//  Guidancer
//
//  Created by Артём Коротков on 03.11.2022.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    func setupContent() {
        descriptionOfPost.usernamePosted(whoAndWhenPost: descriptionOfPost.whoAndWhenPost.text ?? "")
        informationInPost.setupContent(imageView: informationInPost.imageView,
                                       bestPlaceOfCityName: informationInPost.bestPlaceOfCityName.text ?? "",
                                       descriptionOfPlace: informationInPost.descriptionOfPlace.text ?? "")
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        cornerAndBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI elements
    
    private let informationInPost: DescriptionPostSV = {
        let sv = DescriptionPostSV(spacing: 5.0,
                            distribution: .equalCentering,
                            axis: .vertical,
                            aligment: .firstBaseline)
        return sv
    }()
    
    
    
    private let descriptionOfPost: ChangableInfoOfPostSV = {
        let sv = ChangableInfoOfPostSV(spacing: 5.0,
                            distribution: .fill,
                            axis: .horizontal,
                            aligment: .center)
        return sv
    }()
    
    
    //MARK: - Realize UI elements
    
    
    private func setup() {
        
        addSubview(informationInPost)
        addSubview(descriptionOfPost)
        
        NSLayoutConstraint.activate([
            informationInPost.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            informationInPost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: informationInPost.trailingAnchor, constant: 0),
            
            descriptionOfPost.topAnchor.constraint(equalTo: informationInPost.bottomAnchor, constant: 15),
            descriptionOfPost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            trailingAnchor.constraint(equalTo: descriptionOfPost.trailingAnchor, constant: 10),
            bottomAnchor.constraint(equalTo: descriptionOfPost.bottomAnchor, constant: 10)
            
            
        ])
    }
    
    
    private func cornerAndBorder() {
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        
    }
    
    //MARK: - CLASSES
    
    class DescriptionPostSV: UIStackView {

        private let spacingBetween: CGFloat
        private let distributionSV: UIStackView.Distribution
        private let axisSV: NSLayoutConstraint.Axis
        private let aligment: UIStackView.Alignment
        
        init(spacing: CGFloat,
             distribution: UIStackView.Distribution,
             axis: NSLayoutConstraint.Axis,
             aligment: UIStackView.Alignment,
             frame: CGRect = .zero
        ) {
            
            self.spacingBetween = spacing
            self.distributionSV = distribution
            self.axisSV = axis
            self.aligment = aligment
            super.init(frame: frame)
        
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }


        // make UIView
         var imageView: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "rest")!
            image.clipsToBounds = true
            image.layer.cornerRadius = 25.0
            image.translatesAutoresizingMaskIntoConstraints = false
            image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            return image
        }()
        
        
         var bestPlaceOfCityName: GLabel = {
            let label = GLabel(text: "Лучшие итальянские рестораны Санкт-Петербурга",
                               font: UIFont.systemFont(ofSize: 17, weight: .regular),
                               numberOfLines: 0)
            return label
        }()

         var descriptionOfPlace: GLabel = {
            let label = GLabel(text: "В этой прогулке я расскажу вам о лучших итальяннских ресторанах города СПб. Да, это не аудиопрогулка, но зато какой интересный рассказ...",
                               font: UIFont.systemFont(ofSize: 15, weight: .light),
                               numberOfLines: 0)
            return label
        }()
        
        private func setup() {
            addArrangedSubview(imageView)
            addArrangedSubview(bestPlaceOfCityName)
            addArrangedSubview(descriptionOfPlace)
            
            NSLayoutConstraint.activate([
                descriptionOfPlace.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                bestPlaceOfCityName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            ])
        }
        
            func setupContent(imageView: UIImageView, bestPlaceOfCityName: String, descriptionOfPlace: String) {
            self.imageView = imageView
            self.bestPlaceOfCityName.text = bestPlaceOfCityName
            self.descriptionOfPlace.text = descriptionOfPlace
        }
    }
    
    
    class ChangableInfoOfPostSV: UIStackView {
        
        private let spacingBetween: CGFloat
        private let distributionSV: UIStackView.Distribution
        private let axisSV: NSLayoutConstraint.Axis
        private let aligment: UIStackView.Alignment
        
        init(spacing: CGFloat,
             distribution: UIStackView.Distribution,
             axis: NSLayoutConstraint.Axis,
             aligment: UIStackView.Alignment,
             frame: CGRect = .zero
        ) {
            
            self.spacingBetween = spacing
            self.distributionSV = distribution
            self.axisSV = axis
            self.aligment = aligment
            super.init(frame: frame)
            
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        var whoAndWhenPost: GLabel = {
            let label = GLabel(text: "Feliks Omarov 2 дня назад",
                               font: UIFont.systemFont(ofSize: 12, weight: .light),
                               fontColor: .gGray)
            return label
        }()
        
        private  var likesNumber: GLabel = {
            let label = GLabel(text: "228",
                               font: .regular14)
            return label
        }()
        
        private var commentNumber: GLabel = {
            let label = GLabel(text: "228",
                               font: UIFont.systemFont(ofSize: 12, weight: .regular))
            return label
        }()
        
        
        private let commentImage = GLikeCommentButton(icon: UIImage(systemName: "text.bubble"))
        private let heartImage = GLikeCommentButton(icon: UIImage(systemName: "heart"))
        
        
        private func setup() {
            addArrangedSubview(whoAndWhenPost)
            addArrangedSubview(likesNumber)
            addArrangedSubview(heartImage)
            addArrangedSubview(commentNumber)
            addArrangedSubview(commentImage)
        }
        
        func usernamePosted(whoAndWhenPost: String) {
            self.whoAndWhenPost.text = whoAndWhenPost
        }
    }
    
}






