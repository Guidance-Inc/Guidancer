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
    
    private  func cornerAndShadow() {
        self.layer.cornerRadius = 25
        self.backgroundColor = .white
        self.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 7
        self.layer.shadowColor = UIColor.gBlack?.cgColor
    }
    
    func setupContent(image: UIImage?,
                      name: String,
                      descriptionOfPlace: String
    ) {
        informationInPost.setupContent(image: image,
                                       bestPlaceOfCityName: name,
                                       descriptionOfPlace: descriptionOfPlace)
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
        cell.setupContent(image: UIImage(named: "sight"),
                                   name: "Московский Кремль",
                                   descriptionOfPlace: "Моско́вский Кремль — крепость в центре Москвы и древнейшая её часть, главный общественно-политический и историко-художественный комплекс города, официальная резиденция Президента Российской Федерации, вплоть до распада СССР в декабре 1991 года была официальной резиденцией Генерального секретаря ЦК КПСС.")
        return cell
    }
}
