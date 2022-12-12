//
//  MyProfileViewController.swift
//  Guidancer
//
//  Created by Артём Коротков on 06.12.2022.
//

import UIKit

class MyProfileViewController: UIViewController  {
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!

    var image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Image"))
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.setContentHuggingPriority(.defaultHigh + 1, for: .horizontal)
        return image
    }()
    var decsOfProfile = GLabel(text: "Hello everyone! My name is Olivia, i enjoy traveling! Follow me and let’s enjoy together!",
                               font: .systemFont(ofSize: 15), numberOfLines: 0)
    var nickname = GLabel(text: "olivia_spencer",
                          font: .systemFont(ofSize: 17, weight: .bold))
    
    var followers: GLabel = {
        let label = GLabel(text: "150", font: .systemFont(ofSize: 12))
        label.textAlignment = .center
        return label
    }()
    var likes: GLabel = {
        let label = GLabel(text: "300",font: .systemFont(ofSize: 12))
        label.textAlignment = .center
        return label
    }()
    var followButton: GButton = {
        let bt = GButton()
        bt.setTitle("+ add post", for: .normal)
        bt.setTitleColor(UIColor(named: "blue"), for: .normal)
        bt.layer.cornerRadius = 15
        bt.layer.borderWidth = 1
        bt.layer.borderColor = CGColor(red: 20/255, green: 181/255, blue: 232/255, alpha: 1)
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupLayout()
        setupSettingsItemBar()
    }
    private func setupLayout() {
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0 , right: 0)
        layout.itemSize = CGSize(width: 350, height: 200)
    }
    
    func setupSettingsItemBar() {
        var settingsItem = UIBarButtonItem()
        settingsItem = UIBarButtonItem(image: UIImage(named: "set"),
                                         landscapeImagePhone: .none,
                                         style: .done,
                                         target: self,
                                         action: #selector(settingActionItemBar))
        settingsItem.tintColor = .black
        navigationItem.rightBarButtonItem = settingsItem
        
        }
    
    @objc func settingActionItemBar() {
        
    }
    
    func configureView() {
        view.backgroundColor = .white
        //create stackViews
        let imgeAndNameStackView = UIStackView(arrangedSubviews: [image, decsOfProfile])
        imgeAndNameStackView.translatesAutoresizingMaskIntoConstraints = false
        imgeAndNameStackView.spacing = 10
        
        let aboutUser = UIStackView(arrangedSubviews: [nickname, followers, likes])
        aboutUser.translatesAutoresizingMaskIntoConstraints = false
        imgeAndNameStackView.spacing = 30
        imgeAndNameStackView.alignment = .center
        
        let buttonStackView = UIStackView(arrangedSubviews: [followButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        imgeAndNameStackView.spacing = 10
        
        //create collection view
        collectionView = UICollectionView(frame: CGRect(),  collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        
        //add to hierachy
        view.addSubview(collectionView)
        view.addSubview(imgeAndNameStackView)
        view.addSubview(aboutUser)
        view.addSubview(buttonStackView)
        
        //constaints
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            imgeAndNameStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            imgeAndNameStackView.topAnchor.constraint(equalTo: margins.topAnchor,constant: 5),
            margins.trailingAnchor.constraint(equalTo: imgeAndNameStackView.trailingAnchor),
            aboutUser.topAnchor.constraint(equalTo: imgeAndNameStackView.bottomAnchor,constant: 10),
            
            aboutUser.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: aboutUser.trailingAnchor),
            buttonStackView.topAnchor.constraint(equalTo: aboutUser.bottomAnchor,constant: 10),
            
            buttonStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            margins.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            
            image.heightAnchor.constraint(equalToConstant: 100),
            image.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}

extension MyProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        cell.setupContent(post: .mock)
        return cell
    }
    
}
