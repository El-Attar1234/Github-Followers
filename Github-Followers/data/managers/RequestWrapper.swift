//
//  RequestWrapper.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/17/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation


enum Task{
    case requestPlain
       case requestParameters(parameters:[String:String])
}


protocol RequestWrapper {
    var baseURL:String {get}
    var path:String {get}
}
