//
//  RepositoryItemVC.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/19/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class RepositoryItemVC :GeneralItemInfoVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didload in specific RepositoryItemVC item")
        configure()
    }
    private func configure(){
         firstInfoItem.setUpItem(itemType: .repos , withCount: user.publicRepos)
         secondInfoItem.setUpItem(itemType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
 
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for :user)
    }
}
