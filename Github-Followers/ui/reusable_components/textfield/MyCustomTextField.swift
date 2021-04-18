//
//  MyCustomTextField.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/12/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class MyCustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func configure(){
        //for general shape
        layer.cornerRadius    =  10
        layer.borderWidth=3
        layer.borderColor=UIColor.systemGray4.cgColor
        translatesAutoresizingMaskIntoConstraints=false
        //for text
        layer.cornerRadius          = 10
        layer.borderWidth           = 2
        layer.borderColor           = UIColor.systemGray4.cgColor
        
        textColor                   = .label
        tintColor                   = .label
        textAlignment               = .center
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumFontSize             = 12
        returnKeyType               = .go
        backgroundColor             = .tertiarySystemBackground
        autocorrectionType          = .no
        placeholder                 = "Enter a username"
        
        
    }
    
}
