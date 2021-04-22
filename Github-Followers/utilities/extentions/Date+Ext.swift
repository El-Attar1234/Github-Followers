//
//  Date+Ext.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

extension Date{
    func convertToMonthYear()->String{
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
