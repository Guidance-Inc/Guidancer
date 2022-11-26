//
//  CollectionViewCell.swift
//  Guidancer
//
//  Created by Артём Коротков on 03.11.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    private let informationInPost = DescriptionPostSV()
    private let descriptionOfPost = ChangableInfoOfPostSV()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        cornerAndBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let sv = UIStackView(arrangedSubviews: [informationInPost, descriptionOfPost])
        sv.axis = .vertical
        sv.embed(in: contentView)
    }
    
    private func cornerAndBorder() {
        self.layer.cornerRadius = 25
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func setupContent(image: UIImage?,
                      name: String,
                      descriptionOfPlace: String,
                      whoAndWhenPost: String,
                      likes: Int,
                      comments: Int
    ) {
        informationInPost.setupContent(image: image,
                                       bestPlaceOfCityName: name,
                                       descriptionOfPlace: descriptionOfPlace)
        descriptionOfPost.setupContent(whoAndWhenPost: whoAndWhenPost,
                                       likes: likes,
                                       comments: comments)
    }
    
    class DescriptionPostSV: UIStackView {
    
        private var imageView: UIImageView = {
            let image = UIImageView()
            image.clipsToBounds = true
            image.layer.cornerRadius = 25.0
            image.translatesAutoresizingMaskIntoConstraints = false
            image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            return image
        }()
        
        private let bestPlaceOfCityName = GLabel(text: "Лучшие итальянские рестораны Санкт-Петербурга",
                                                 font: UIFont.systemFont(ofSize: 17, weight: .regular),
                                                 numberOfLines: 0)
        
        private let descriptionOfPlace = GLabel(text: "В этой прогулке я расскажу вам о лучших итальяннских ресторанах города СПб. Да, это не аудиопрогулка, но зато какой интересный рассказ...",
                                                font: UIFont.systemFont(ofSize: 15, weight: .light),
                                                numberOfLines: 0)
        
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
    
    
    class ChangableInfoOfPostSV: UIView {
        
        private let whoAndWhenPost = GLabel(font: UIFont.systemFont(ofSize: 12, weight: .light),
                                            fontColor: .gGray)
        
        private let likesNumber = GLabel(font: .regular14)
        
        private let commentNumber = GLabel(font: .regular14)
        
        private let commentImage = GLikeCommentButton(icon: UIImage(systemName: "heart"))
        private let heartImage = GLikeCommentButton(icon: UIImage(systemName: "star"))
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setup() {
            likesNumber.setSize(width: 30)
            commentNumber.setSize(width: 30)
            let stack = UIStackView(arrangedSubviews: [whoAndWhenPost, likesNumber, heartImage, commentNumber, commentImage])
            stack.alignment = .fill
            stack.axis = .horizontal
            stack.distribution = .fillProportionally
            stack.spacing = 5
            stack.embed(in: self, with: .padding(top: 15, right: 10, bottom: 10, left: 10))
        }
        
        func setupContent(whoAndWhenPost: String,
                          likes: Int,
                          comments: Int) {
            self.whoAndWhenPost.text = whoAndWhenPost
            commentNumber.text = String(comments)
            likesNumber.text = String(likes)
        }
    }
    
}

//MARK: - TestCollectionView

class TestCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var cellIdentifier = "Cell"
    let padding: CGFloat = 50.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0 , right: 0)
        layout.itemSize = CGSize(width: 350, height: 350)
        
        
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(collectionView)
        
    }
}

extension TestCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        cell.setupContent(image: UIImage(systemName: "star"),
                          name: "Post Name",
                          descriptionOfPlace: "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                          whoAndWhenPost: "Test who send",
                          likes: 200, comments: 250)
        return cell
    }
    
}





