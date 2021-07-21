//
//  AccountManager.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

class AccountManager: ObservableObject {
    
    var userDefaults = UserDefaults.standard
    
    func isUserAuthenticated() -> Bool {
        return userDefaults.string(forKey: "accessToken") != nil
    }
    
    func getAccountName() -> String {
        return userDefaults.string(forKey: "userName") ?? "Name not available"
    }
    
    func getToken() -> String {
        return userDefaults.string(forKey: "accessToken") ?? "Token not available"
    }
    
    func generateToken() -> String {
        return UUID().uuidString
    }
    
}
