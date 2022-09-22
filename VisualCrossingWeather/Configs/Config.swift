//
//  Config.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 21/09/2022.
//

import Foundation
import UIKit

let charSet = CharacterSet.whitespacesAndNewlines
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let Global = GlobalClass.sharedInstance
let kAppName = "VisualCrossingWeather"


//MARK: Connectivity Messages
let kNoInternet = "No Internet Connection. Make sure your device is connected to the internet."
let kServerIssue = "There seems to be some problem either with your connection or our server, please try again."
let kInvalidResponse = "Invalid Server Response"
let kTryAgain = "Unable to connect with server. Please try again later."
let kSessionExpired = "Your session has expired. Please login again."

struct AlertMessages {
    
    static let alert = "Alert"
    static let ok = "Ok"
    static let login_sucessfull = "Login Successfully...!"
    static let enterUsername = "Please enter your username."
    static let enterPassword = "Please enter your password."
    static let enterNewPassword = "Please enter your new password."
    static let enterConfirmPassword = "Please enter your confirm password."
    static let passwordNotMatch = "Current password and new password must be same."
    static let passwordLimitExceeded = "Password must contain minimum 8 characters at least 1 uppercase alphabet, 1 lowercase alphabet, 1 number and 1 special character."
}
