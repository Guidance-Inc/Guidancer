//
//  SearchScreenCollectionViewCell.swift
//  Guidancer
//
//  Created by Артём Коротков on 24.11.2022.
//

import UIKit

class SearchScreenCollectionViewCell: PostCollectionViewCell {
    
    override func setup() {
        let sv = UIStackView(arrangedSubviews: [informationInPost])
       sv.axis = .vertical
       sv.embed(in: contentView)
    }
}

