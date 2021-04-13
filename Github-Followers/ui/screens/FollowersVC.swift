//
//  FollowersVC.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/12/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class FollowersVC: UIViewController {
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
       navigationController?.navigationBar.prefersLargeTitles = true
    }
override func viewWillAppear(_ animated: Bool) {
    super.viewDidLoad()
    print("followers will apear")
   //  navigationController?.isNavigationBarHidden = false
      navigationController?.setNavigationBarHidden(false, animated: true)
}

}
