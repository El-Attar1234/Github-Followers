//
//  FollowerCollectionViewCell.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/15/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
       let avatarImageView = CustomFollowerImage(frame: .zero)
       let usernameLabel   = CustomTitleLabel(textAlignment: .center, fontSize: 16)
       
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           configure()
       }
       
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
       func set(follower: Follower) {
           usernameLabel.text = follower.login
        avatarImageView.downloadImage(url: follower.avatarUrl)
       }
       
       
       private func configure() {
           addSubview(avatarImageView)
           addSubview(usernameLabel)
           
           let padding: CGFloat = 8
           
           NSLayoutConstraint.activate([
               avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
               avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
               avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
               avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
               
               usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
               usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
               usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
               usernameLabel.heightAnchor.constraint(equalToConstant: 20)
           ])
       }
}
