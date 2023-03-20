//
//  CustomTableViewCell.swift
//  Guidancer
//
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let identifier = "CustomTableViewCell"
    
    private let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private let secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image2")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        contentView.addSubview(firstImageView)
        contentView.addSubview(myLabel)
        contentView.addSubview(secondImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String, firstImage: String, secondImage: String) {
        
        firstImageView.image = UIImage(named: firstImage)
        myLabel.text = text
        secondImageView.image = UIImage(named: secondImage)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        firstImageView.image = nil
        myLabel.text = nil
        secondImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height-6
                
        firstImageView.frame = CGRect(x: contentView.frame.size.width+imageSize,
                               y: 3,
                               width: imageSize,
                                height: imageSize)
        
        myLabel.frame = CGRect(x: 10+imageSize,
                               y: 5,
                               width: contentView.frame.size.width - 10 - imageSize,
                               height: contentView.frame.size.height-10)
        
        secondImageView.frame = CGRect(x: contentView.frame.size.width-imageSize,
                                   y: 3,
                                   width: imageSize,
                                   height: imageSize)
    }
}

