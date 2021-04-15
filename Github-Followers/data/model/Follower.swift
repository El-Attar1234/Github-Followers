//
//  Follower.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/13/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class Follower: Codable {
    var login: String?
    var avatarUrl: String?
    
    enum CodingKeys : String , CodingKey {
        case login="login"
        case avatarUrl="avatar_url"
    }
}
