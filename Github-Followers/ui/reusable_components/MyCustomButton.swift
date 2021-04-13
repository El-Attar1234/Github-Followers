//
//  MyCustomButton.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/12/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class MyCustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    init(backgroundColor:UIColor ,title:String) {
        super.init(frame:.zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure(){
        layer.cornerRadius    =  10
        titleLabel?.textColor =  .white
        titleLabel?.font      =  UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints=false
        
    }
}
