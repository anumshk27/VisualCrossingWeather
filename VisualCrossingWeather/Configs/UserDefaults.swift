//
//  UserDefaults.swift
//  VisualCrossingWeather
//
//  Created by Muhammad Anum on 22/09/2022.
//

import Foundation

extension UserDefaults {
    
    class var last_fetch: String? {
        get {
            return UserDefaults.standard.string(forKey: "fetch_date")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "fetch_date")
        }
    }
    
    func remove(key: String) {
        removeObject(forKey: key)
        synchronize()
    }
    
    func reset() {
        if let appDomain = Bundle.main.bundleIdentifier {
            removePersistentDomain(forName: appDomain)
        }
    }
}

