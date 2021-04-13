//
//  UIViewController+Extensions.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/13/21.
//  Copyright © 2021 ITI. All rights reserved.
//

//import Foundation

import UIKit

extension UIViewController{
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = AlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
