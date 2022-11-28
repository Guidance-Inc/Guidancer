//
//  SearchScreenCollectionViewCell.swift
//  Guidancer
//
//  Created by Артём Коротков on 24.11.2022.
//

import UIKit

class SearchScreenCollectionViewCell: PostCollectionViewCell {
    ///HELLO REBYATA, ITS TEMA!
    private let informationInPost = ChangableInfoOfPostSV()

    override func setup() {
        super.setup()
        contentStackView.addArrangedSubview(informationInPost)
    }

    override func setupContent(post: GPost) {
        super.setupContent(post: post)
        informationInPost.setupContent(whoAndWhenPost: post.whoAndWhenPost,
                                       profileUserImageView: post.profileUserImageView,
                                       likes: post.likes, comments: post.comments)
    }

    private final class ChangableInfoOfPostSV: UIView {

         var profileUserImageView: UIImageView = {
            let image = UIImageView()
            image.frame.size = CGSize(width: 50, height: 50)
             image.clipsToBounds = true
            return image
        }()

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

        override func layoutSubviews() {
            super.layoutSubviews()
            NSLayoutConstraint.activate([
                profileUserImageView.heightAnchor.constraint(equalToConstant: 50),
                profileUserImageView.widthAnchor.constraint(equalToConstant: 20)
            ])
            profileUserImageView.layer.cornerRadius = 10
            self.clipsToBounds = true
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

