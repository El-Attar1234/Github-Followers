//
//  Follower.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/13/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

struct Follower: Codable {
    let uuid = UUID()
    
   
    
    var login: String
    var avatarUrl: String
    
    enum CodingKeys : String , CodingKey {
        case login="login"
        case avatarUrl="avatar_url"
    }
}
extension Follower : Hashable {
    static func ==(lhs: Follower, rhs: Follower) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
