//
//  FavouritesVC.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/12/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class FavouritesVC: UIViewController {

    override func viewDidLoad() {
         print("favourite didLoad")
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    
        
        PersistenceManager.retrieveFavorites { (response) in
            switch response {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                break
            }
        }
        
    }
    

}
