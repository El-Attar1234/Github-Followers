//
//  CustomFollowerImage.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/15/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class CustomFollowerImage: UIImageView {

   let placeholderImage = UIImage(named: "avatar-placeholder")!

       override init(frame: CGRect) {
           super.init(frame: frame)
           configure()
       }
       
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       
       private func configure() {
           layer.cornerRadius  = 10
           clipsToBounds       = true
           image               = placeholderImage
           translatesAutoresizingMaskIntoConstraints = false
       }

}
