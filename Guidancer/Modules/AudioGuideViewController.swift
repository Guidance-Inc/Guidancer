//
//  AudioGuideViewController.swift
//  Guidancer
//
//  Created by Артём Коротков on 13.12.2022.
//

import UIKit

class AudioGuideViewController: UIViewController {

    private let collectionImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mapImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Image")
        image.clipsToBounds = true
        image.layer.cornerRadius = 25
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameOfGuide: GLabel = {
        let name = GLabel(text: "Tour of the night city",font: .systemFont(ofSize: 25, weight: .semibold))
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        name.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return name
    }()
    
    private let descriptionOfGuide: GLabel = {
        let name = GLabel(text: "Enable village offered several perpetual means law knew. Vanity observe objection relation enquire themselves shortly unsatiable wicket sex. Desirous dine moonlight they shot mother instrument stuff earnestly called rank betrayed unaffected eagerness belonging latter behaviour.",
                          font: .systemFont(ofSize: 20, weight: .regular),
                          numberOfLines: 0)
        name.textAlignment = .center
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private let dateLabel: GLabel = {
        let label = GLabel(text: "11 Nov 2022", font: .systemFont(ofSize: 13, weight: .regular))
        label.textAlignment = .right
        label.backgroundColor = .gray
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private let profileNickNameLabel: GLabel = {
        let label = GLabel(text: "olivia_spencer", font: .systemFont(ofSize: 13, weight: .regular))
        label.textAlignment = .left
        label.backgroundColor = .red
        
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: "Favorite"), for: .normal)
        return bt
    }()
    
    private let playButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "play"), for: .normal)
        return bt
    }()
    
    private let commentButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(systemName: "text.bubble.fill"), for: .normal)
        return bt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createStackViews()
        
    }
    
    
    private func createStackViews() {
        view.backgroundColor = .white
        let buttonStackView = UIStackView(arrangedSubviews: [favoriteButton,playButton,commentButton])
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        
        let infoStackView = UIStackView(arrangedSubviews: [dateLabel,profileImage,profileNickNameLabel])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.distribution = .fill
        infoStackView.axis = .horizontal
        infoStackView.spacing = 10
        
        let mainStackView = UIStackView(arrangedSubviews: [collectionImage,nameOfGuide,descriptionOfGuide,infoStackView,buttonStackView])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 10
        
        view.addSubview(mainStackView)
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            mainStackView.topAnchor.constraint(equalTo: margins.topAnchor),
            margins.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            margins.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            
            collectionImage.heightAnchor.constraint(equalToConstant: 250),
            profileImage.heightAnchor.constraint(equalToConstant: 50),
            profileImage.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    private func createInfoAboutPostStackView() {
      
    }
    
    private func createMainStackView() {
        
    }


}
