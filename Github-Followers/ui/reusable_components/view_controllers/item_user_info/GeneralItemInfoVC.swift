//
//  GeneralItemInfoVC.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/19/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class GeneralItemInfoVC: UIViewController {
  
      let stackView=UIStackView()
      let firstInfoItem=ItemInfoView()
      let secondInfoItem=ItemInfoView()
      let actionButton=MyCustomButton()
    
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
           configureBackground()
               addSubViews()
               layoutUI()
               configureStackView()
    }
    
    private func configureBackground(){
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }
    private func addSubViews(){
        view.addSubview(stackView)
        view.addSubview(actionButton)
    }
    private func layoutUI(){
        let padding : CGFloat = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    private func configureStackView(){
        stackView.axis         = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(firstInfoItem)
        stackView.addArrangedSubview(secondInfoItem)
    }
    

}
