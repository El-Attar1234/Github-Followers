//
//  ItemInfoView.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/19/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

enum ItemInfoType{
    case repos , gists , followers , following
}

class ItemInfoView: UIView {
    
    let imageView=UIImageView()
    let itemTitle=CustomTitleLabel(textAlignment: .left, fontSize: 14)
    let itemCount=CustomTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addViews()
        layoutUI()
        
    }
    private func addViews(){
      addSubview(imageView)
      addSubview(itemTitle)
      addSubview(itemCount)
    }
    private func layoutUI(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor   = .label
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 20),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            
            itemTitle.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            itemTitle.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            itemTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemTitle.heightAnchor.constraint(equalToConstant: 18),
            
            itemCount.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            itemCount.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             itemCount.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemCount.heightAnchor.constraint(equalToConstant: 18)
            
        ])
        
    }
    
    func setUpItem(itemType:ItemInfoType , withCount count:Int){
        itemCount.text=String(count)
        
        switch itemType {
        case .followers:
            itemTitle.text  = "Public Followers"
            imageView.image = UIImage(systemName: Constants.FOLLOWERS_IMAGE)
        case .repos:
             itemTitle.text = "Public Repos"
             imageView.image = UIImage(systemName: Constants.REPOS_IMAGE)
        case .gists:
             itemTitle.text = "Public Gists"
             imageView.image = UIImage(systemName: Constants.GISTS_IMAGE)
        case .following:
             itemTitle.text = "Public Following"
             imageView.image = UIImage(systemName: Constants.FOLLOWING_IMAGE)
        }
    }
}
