//
//  GlobalClass.swift
//  VisualCrossingWeather
//
//  Created by Haider Shahzad on 21/09/2022.
//

import Foundation
import UIKit

class GlobalClass {
    
    static let sharedInstance = GlobalClass()
    
    func showNetworkAlert() {
        DispatchQueue.main.async {
            let networkAlert = UIAlertController(title: kAppName, message: kNoInternet, preferredStyle: .alert)
            networkAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            appDelegate.window?.rootViewController?.present(networkAlert, animated: true, completion: nil)
        }
    }
    
    func getToday() -> String {
        let dt = DateFormatter()
        dt.dateFormat = "yyyy-MM-dd"
        return dt.string(from: Date())
    }
    
}
