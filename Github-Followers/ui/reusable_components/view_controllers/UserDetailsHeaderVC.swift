//
//  UserDetailsHeaderVC.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/17/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class UserDetailsHeaderVC: UIViewController {
    let userImage=CustomFollowerImage(frame: .zero)
    let userName=CustomTitleLabel(textAlignment: .left, fontSize: 34)
    let actualName=SecondaryTitleLabel(fontSize: 20)
    let imageLocation=UIImageView()
    let locationLabel=SecondaryTitleLabel(fontSize: 18)
    let bioLabel = customBodyLabel(textAlignment: .left)
    
    var user:User!
    init(user:User) {
        super.init(nibName:nil, bundle: nil)
        self.user=user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubViews()
        self.initializeUi()
        self.configure()
    }
    private func configure(){
        userImage.downloadImage(url: user.avatarUrl)
        userName.text           = user.login
        actualName.text         =  user.name ?? ""
        imageLocation.image     = UIImage(systemName : Constants.LOCATION_IMAGE)
        imageLocation.tintColor = .secondaryLabel
        locationLabel.text      = user.location ?? "No Location"
        bioLabel.text           = user.bio ?? "No Bio Available"
        bioLabel.numberOfLines  = 3
        
    }
    private func addSubViews(){
        view.addSubview(userImage)
        view.addSubview(userName)
        view.addSubview(actualName)
        view.addSubview(imageLocation)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
    }
    private func initializeUi(){
        
        let padding:CGFloat = 20
         let textImageadding:CGFloat = 12
        imageLocation.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            userImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            userImage.widthAnchor.constraint(equalToConstant: 90),
            userImage.heightAnchor.constraint(equalToConstant: 90),
            
            userName.topAnchor.constraint(equalTo : userImage.topAnchor),
            userName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: textImageadding),
            userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            userName.heightAnchor.constraint(equalToConstant: 38),
            
            
            actualName.centerYAnchor.constraint(equalTo: userImage.centerYAnchor , constant: 8),
            actualName.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: textImageadding),
            actualName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actualName.heightAnchor.constraint(equalToConstant: 20),
            
            imageLocation.bottomAnchor.constraint(equalTo: userImage.bottomAnchor),
            imageLocation.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: textImageadding),
            imageLocation.widthAnchor.constraint(equalToConstant: 20),
            imageLocation.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: imageLocation.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: imageLocation.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: textImageadding),
            bioLabel.leadingAnchor.constraint(equalTo: userImage.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60),
            
        ])
    }
    
    
}
