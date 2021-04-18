//
//  EmptyStateView.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/16/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class EmptyStateView: UIView {
    let messageLabel=CustomTitleLabel(textAlignment: .center, fontSize: 30)
    let emptyLogoImage=UIImageView()

    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    init(message:String) {
        super.init(frame:.zero)
        messageLabel.text=message
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(messageLabel)
        addSubview(emptyLogoImage)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        emptyLogoImage.image=UIImage(named:"empty-state-logo")
        emptyLogoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:-30),
            messageLabel.heightAnchor.constraint(equalToConstant: 250),
            
            emptyLogoImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            emptyLogoImage.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            emptyLogoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 180),
            emptyLogoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 60)
            
        ])
        
    }
    
}
