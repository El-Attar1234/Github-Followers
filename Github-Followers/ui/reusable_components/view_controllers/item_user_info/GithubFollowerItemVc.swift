//
//  GithubFollowerItemVc.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/19/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class GithubFollowerItemVc :GeneralItemInfoVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload in specific follower item")
        configure1()
       
    }
    private func configure1(){
         firstInfoItem.setUpItem(itemType: .followers, withCount: user.followers)
         secondInfoItem.setUpItem(itemType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for :user)
    }

}

