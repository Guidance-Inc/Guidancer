//
//  PostCollectionViewCell.swift
//  Guidancer
//
//  Created by Артём Коротков on 20.11.2022.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
     let informationInPost = DescriptionPostSV()
     let descriptionOfPost = ChangableInfoOfPostSV()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        cornerAndShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func setup() {
         let sv = UIStackView(arrangedSubviews: [informationInPost, descriptionOfPost])
        sv.axis = .vertical
        sv.embed(in: contentView)
    }
    
     func cornerAndShadow() {
        self.layer.cornerRadius = 25
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 7
        self.layer.shadowColor = UIColor.gBlack?.cgColor
    }
    
    func setupContentForSearch(image: UIImage?,
                      name: String,
                      descriptionOfPlace: String,
                      whoAndWhenPost: String,
                      profileUserImageView: UIImage?,
                      likes: Int,
                      comments: Int
    ) {
        informationInPost.setupContent(image: image,
                                       bestPlaceOfCityName: name,
                                       descriptionOfPlace: descriptionOfPlace)
        descriptionOfPost.setupContent(whoAndWhenPost: whoAndWhenPost,
                                       profileUserImageView: profileUserImageView,
                                       likes: likes,
                                       comments: comments)
    }
    
    func setupContentForProfile(image: UIImage?,
                                 name: String,
                                 descriptionOfPlace: String
    ) {
        informationInPost.setupContent(image: image,
                                       bestPlaceOfCityName: name,
                                       descriptionOfPlace: descriptionOfPlace)
    }
    
    class DescriptionPostSV: UIStackView {
        
//        private let viewMoreButton: GButton = {
//            let bt = GButton { _ in
//
//            }
//            bt.setTitleColor(.orange, for: .normal)
//            bt.setTitle("View more...", for: .normal)
//            bt.titleLabel?.font = .systemFont(ofSize: 13)
//            return bt
//        }()
                             
                             
                             
         var imageView: UIImageView = {
            let image = UIImageView()
            image.clipsToBounds = true
            image.layer.cornerRadius = 25.0
            image.translatesAutoresizingMaskIntoConstraints = false
            image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            return image
        }()
        
         let bestPlaceOfCityName = GLabel(text: "Лучшие итальянские рестораны Санкт-Петербурга",
                                                 font: UIFont.systemFont(ofSize: 17, weight: .regular),
                                                 numberOfLines: 0)
        
         let descriptionOfPlace = GLabel(text: "В этой прогулке я расскажу вам о лучших итальяннских ресторанах города СПб. Да, это не аудиопрогулка, но зато какой интересный рассказ...",
                                                font: UIFont.systemFont(ofSize: 15, weight: .light),
                                                numberOfLines: 0)
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
  
//        private func viewMore() {
//            let sizeOfTextFrame = descriptionOfPlace.frame.size.height
//            if sizeOfTextFrame > sizeOfTextFrame + 1 {
//
//            }
//
//        }
     
         func setup() {
   
            spacing = 5
            distribution = .equalCentering
            axis = .vertical
            alignment = .firstBaseline
            addArrangedSubview(imageView)
            addArrangedSubview(bestPlaceOfCityName)
            addArrangedSubview(descriptionOfPlace)
//            addArrangedSubview(viewMoreButton)
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
        
         var profileUserImageView: UIImageView = {
            let image = UIImageView()
            image.frame.size = CGSize(width: 50, height: 50)
             image.clipsToBounds = true
            return image
        }()
        override func layoutSubviews() {
            super.layoutSubviews()
            NSLayoutConstraint.activate([
                profileUserImageView.heightAnchor.constraint(equalToConstant: 50),
                profileUserImageView.widthAnchor.constraint(equalToConstant: 20)
            ])
            profileUserImageView.layer.cornerRadius = 10
            self.clipsToBounds = true
        }
         let whoAndWhenPost = GLabel(font: UIFont.systemFont(ofSize: 12, weight: .light),
                                            fontColor: .gGray)
        
         let likesNumber = GLabel(font: .regular14)
        
         let commentNumber = GLabel(font: .regular14)
        
         let commentImage = GLikeCommentButton(icon: UIImage(systemName: "heart"))
         let heartImage = GLikeCommentButton(icon: UIImage(systemName: "text.bubble"))
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setup() {
            likesNumber.setSize(width: 30)
            likesNumber.textAlignment = .left
            commentNumber.setSize(width: 30)
            commentNumber.textAlignment = .left
            let stack = UIStackView(arrangedSubviews: [profileUserImageView,whoAndWhenPost,heartImage, likesNumber, commentImage,commentNumber])
            stack.alignment = .fill
            stack.distribution = .fillProportionally
            stack.spacing = 5
            stack.embed(in: self, with: .padding(top: 15, right: 10, bottom: 10, left: 10))
        }
        
        func setupContent(whoAndWhenPost: String,
                          profileUserImageView: UIImage?,
                          likes: Int,
                          comments: Int) {
            self.profileUserImageView.image = profileUserImageView
            self.whoAndWhenPost.text = whoAndWhenPost
            commentNumber.text = String(comments)
            likesNumber.text = String(likes)
        }
    }
}

//MARK: - TestCollectionView

class TestCollectionViewII: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    var cellIdentifier = "Cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0 , right: 0)
        layout.itemSize = CGSize(width: 350, height: 200)
        
       
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        self.view.addSubview(collectionView)
        
    }
}

extension TestCollectionViewII {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath as IndexPath) as! PostCollectionViewCell
        cell.setupContentForSearch(image: UIImage(named: "sight"),
                          name: "Московский Кремль",
                          descriptionOfPlace: "Моско́вский Кремль — крепость в центре Москвы и древнейшая её часть, главный общественно-политический и историко-художественный комплекс города, официальная резиденция Президента Российской Федерации, вплоть до распада СССР в декабре 1991 года была официальной резиденцией Генерального секретаря ЦК КПСС.",
                          whoAndWhenPost: "Artyom Korotkov",
                          profileUserImageView: UIImage(named: "sight"),
                          likes: 8, comments: 8)
        return cell
    }
}
