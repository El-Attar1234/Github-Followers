//
//  ErrorMessage.swift
//  Github-Followers
//
//  Created by Mahmoud Elattar on 4/15/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
enum ErrorMessage: String ,Error{
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
    //favourites
    case unableToFavourite   = "There is an error during favouriting this use."
    case alreadyInFavourites = "the user is already in favourites"
}
 
