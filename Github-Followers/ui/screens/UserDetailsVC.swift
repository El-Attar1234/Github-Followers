//
//  UserDetailsVC.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/17/21.
//  Copyright © 2021 ITI. All rights reserved.
//

//https://api.github.com/users/El-Attar1234

import UIKit

class UserDetailsVC: UIViewController {
    var userName      : String!
    var detailsHeader : UserDetailsHeaderVC!
    var firstItem     : RepositoryItemVC!
    var secondItem    : GithubFollowerItemVc!
    let headerView    = UIView()
    let firstItemView = UIView()
    let secondtemView = UIView()
    let dateLabel     = customBodyLabel(textAlignment: .center)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        getUserDetails(for: userName)
        
        
    }
    private func configureVC(){
        view.backgroundColor = .systemBackground
        let doneButton=UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem=doneButton
    }
    @objc private func dismissVC(){
        self.dismiss(animated: true)
    }
    
    private func getUserDetails(for username:String){
        showLoadingIndicator()
        NetworkManager.sharedNetworkManager.getUserDetails(for: username) { [weak self](result) in
            guard let self=self else{ return}
            self.hideLoadingIndicator()
            switch result{
            case .success(let user):
                DispatchQueue.main.async {
                    self.showUserDetails(user: user)
                    self.dateLabel.text = "GitHub since \(user.createdAt.convertToDisplayFormat())"
                }
                
                print("\(user)")
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
                
            }}
    }
    
    
    
    private func showUserDetails(user:User){
        layoutUI()
        detailsHeader=UserDetailsHeaderVC(user: user)
        firstItem=RepositoryItemVC(user: user)
        secondItem=GithubFollowerItemVc(user: user)
        add(childVc: detailsHeader, to: headerView)
        add(childVc: firstItem, to: firstItemView)
        add(childVc: secondItem, to: secondtemView)
        // view.addSubview(detailsHeader)
        
    }
    private func layoutUI(){
        let itemViews=[headerView,firstItemView,secondtemView,dateLabel]
        for itemView in itemViews{
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            firstItemView.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 20),
            firstItemView.heightAnchor.constraint(equalToConstant: 140),
            
            secondtemView.topAnchor.constraint(equalTo: firstItemView.bottomAnchor,constant: 20),
            secondtemView.heightAnchor.constraint(equalToConstant: 140),
            
            dateLabel.topAnchor.constraint(equalTo: secondtemView.bottomAnchor,constant: 20),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    private func add(childVc:UIViewController ,to containerView:UIView){
        addChild(childVc)
        containerView.addSubview(childVc.view)
        childVc.view.frame=containerView.bounds
        childVc.didMove(toParent: self)
    }
    
    
    
}
