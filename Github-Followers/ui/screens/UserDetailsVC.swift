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
    var userName:String!
    var detailsHeader:UserDetailsHeaderVC!
    let headerView=UIView()

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
                }
               
             print("\(user)")
             case .failure(let error):
                 self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "OK")
                 
             }}
     }
    
   
    
    private func showUserDetails(user:User){
        layoutUI()
     detailsHeader=UserDetailsHeaderVC(user: user)
        add(childVc: detailsHeader, to: headerView)
       // view.addSubview(detailsHeader)
        
    }
     private func layoutUI(){
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
       headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        headerView.heightAnchor.constraint(equalToConstant: 200)])
        
    }
    
    private func add(childVc:UIViewController ,to containerView:UIView){
      addChild(childVc)
        containerView.addSubview(childVc.view)
        childVc.view.frame=containerView.bounds
        childVc.didMove(toParent: self)
    }
    
  

}
