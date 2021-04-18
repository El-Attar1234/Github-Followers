//
//  DataSourceWrapper.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/17/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
enum DataSourceWrapper {
    case getFollowers
    case getDetails
}
extension DataSourceWrapper:RequestWrapper{
    var baseURL: String {
        return Constants.BASE_URL
    }
    
    var path: String {
        return ""
    }
    
    
}
