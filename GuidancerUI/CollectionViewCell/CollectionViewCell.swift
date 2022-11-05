//
//  CollectionViewCell.swift
//  Guidancer
//
//  Created by Артём Коротков on 03.11.2022.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - var/let
    let collectionCell = UICollectionViewCell()
    let padding: CGFloat = 50.0 //TODO: - clear
    let spacing: CGFloat = 25.0
    
    func setupContent() {
        secondSV.setupContent(whoAndWhenPost: <#T##String#>)
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
    
    
    
        let firstSV: verticalSV = { //TODO: - hide in class
            let sv = verticalSV()
            sv.spacing = CGFloat(5.0)
            sv.distribution = .equalCentering
            sv.axis = .vertical
            sv.alignment = .firstBaseline
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()

        private let secondSV: HorizontalSV = {
            let sv = HorizontalSV()
            sv.spacing = CGFloat(5.0)
            sv.distribution = .fill
            sv.alignment = .center
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()
    

    
    //MARK: - Realize UI elements
    
    
    func setup() {
        
        addSubview(firstSV)
        addSubview(secondSV)
        
        NSLayoutConstraint.activate([
            firstSV.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            firstSV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            trailingAnchor.constraint(equalTo: firstSV.trailingAnchor, constant: 0),
            
            secondSV.topAnchor.constraint(equalTo: firstSV.bottomAnchor, constant: 15),
            secondSV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            trailingAnchor.constraint(equalTo: secondSV.trailingAnchor, constant: 10),
            bottomAnchor.constraint(equalTo: secondSV.bottomAnchor, constant: 10)
            
            
        ])
    }
    
    
    func cornerAndBorder() {
        //        self.layer.masksToBounds = true
        //        self.clipsToBounds = true
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        
    }
    
}


fileprivate class HorizontalSV: UIStackView { //TODO: - change class name

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent(whoAndWhenPost: String) { //TODO: - setupContent
        self.whoAndWhenPost.text = whoAndWhenPost
    }
    
    let whoAndWhenPost: GLabel = {
        let label = GLabel(text: "Feliks Omarov 2 дня назад",
                           font: UIFont.systemFont(ofSize: 12, weight: .light))
        label.textColor = UIColor.gGray
        return label
    }()

    let likesNumber: GLabel = {
        let label = GLabel(text: "228",
                           font: .regular14)
        label.textColor = .gBlack
        return label
    }()
    
    let commentNumber: GLabel = {  // TODO: - Refactoer
        let label = GLabel(text: "228",
                           font: UIFont.systemFont(ofSize: 12, weight: .regular))
        label.textColor = .gBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let heartImage = GLikeCommentButton(icon: <#T##UIImage?#>)
    
    let commentImage: GLikeCommentButton = { //TODO: - refactore
//        let image = GLikeCommentButton(systemNameImage: "text.bubble")
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



