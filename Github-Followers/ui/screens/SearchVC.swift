//
//  SearchVC.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/12/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    let logoImageView       = UIImageView()
    let usernameTextField   = MyCustomTextField()
    let callToActionButton  = MyCustomButton(backgroundColor: .systemGreen, title: "Get Followers")
    	
 var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
    override func viewDidLoad() {
        super.viewDidLoad()
       // navigationController?.isNavigationBarHidden=true
       view.backgroundColor = .systemBackground
              configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
         print("search will apear")
      //  navigationController?.isNavigationBarHidden=true
          navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func createDismissKeyboardTapGesture() {
          let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
          view.addGestureRecognizer(tap)
      }
    
    @objc func pushFollowerListVC() {
          guard isUsernameEntered else {
             presentGFAlertOnMainThread(title: "Eroor", message: "Please enter username of the git hub repo😡", buttonTitle: "OK")
              return
          }
          
          let followerListVC      = FollowersVC()
          followerListVC.username = usernameTextField.text
          navigationController?.pushViewController(followerListVC, animated: true)
      }
    
    func configureLogoImageView() {
         view.addSubview(logoImageView)
         usernameTextField.delegate = self
         logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: Constants.LOGO)
         
         NSLayoutConstraint.activate([
             logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
             logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             logoImageView.heightAnchor.constraint(equalToConstant: 200),
             logoImageView.widthAnchor.constraint(equalToConstant: 200)
         ])
     }
    func configureTextField() {
          view.addSubview(usernameTextField)
          
          NSLayoutConstraint.activate([
              usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60),
              usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
              usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
              usernameTextField.heightAnchor.constraint(equalToConstant: 50)
          ])
      }
    func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
            callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            callToActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
