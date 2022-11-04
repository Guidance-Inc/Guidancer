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
    let padding: CGFloat = 50.0
    let spacing: CGFloat = 25.0
    
    
    
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
    
    
    
        let firstSV: verticalSV = {
            let sv = verticalSV()
            sv.spacing = CGFloat(5.0)
            sv.distribution = .equalCentering
            sv.axis = .vertical
            sv.alignment = .firstBaseline
            sv.translatesAutoresizingMaskIntoConstraints = false
            return sv
        }()

        let secondSV: horizontalSV = {
            let sv = horizontalSV()
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




