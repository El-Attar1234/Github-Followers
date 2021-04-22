//
//  String+Ext.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

extension String{
    func convertToDate()->Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale     = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone   = .current
        return dateFormatter.date(from: self)
    }
    func convertToDisplayFormat() ->String{
        guard let date = self.convertToDate() else {return "N/A"}
        return date.convertToMonthYear()
    }
}
