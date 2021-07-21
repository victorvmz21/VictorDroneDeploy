//
//  UserViewModel.swift
//  VIctor's_DroneDeploy_Test
//
//  Created by Victor Monteiro on 7/21/21.
//

import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var email: String    = ""
    @Published var password: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var isLoadingScreen: Bool = false
    @Published var isGettingError:  Bool = false
    
    var userDefaults = UserDefaults.standard
    var accountManager = AccountManager()
    var mockUser = User(email: "test@dronedeploy.com", name: "Victor", password: "secret@secret", accessToken: nil)
    
    func login(email: String, password: String) {
        
        
        if email == mockUser.email && password == mockUser.password {
            
            self.mockUser.accessToken = self.accountManager.generateToken()
            
            userDefaults.setValue(self.mockUser.accessToken!, forKey: "accessToken")
            userDefaults.setValue(mockUser.name, forKey: "userName")
            
            self.isLoadingScreen = false
            self.isAuthenticated = true
            
            print("is User authenticated \(accountManager.isUserAuthenticated())")
        
            
        } else {
            
            self.isGettingError  = true
            self.isLoadingScreen = false
            self.isAuthenticated = false
        }
        
    }
    
    func logout() {
        
        if accountManager.isUserAuthenticated() {
            
            userDefaults.removeObject(forKey: "accessToken")
            userDefaults.removeObject(forKey: "userName")
            
            self.isAuthenticated = false
            print("is User authenticated \(accountManager.isUserAuthenticated())")
        }
        
    }
    
    func getuserName() -> String {
        self.accountManager.getAccountName()
    }
    
    func getToken() -> String {
        return self.accountManager.getToken()
    }
    
    func generateRandomToken() -> String {
        return UUID().uuidString
    }
    
    func ErrorHandling() -> String {
        
        if self.email.isEmpty || self.password.isEmpty {
            return "Email and Password required."
        } else if self.email !=  mockUser.email || self.password != mockUser.password {
           return "Email or Password doesnt match."
        } else {
           return "Something went wrong please try again."
        }
        
    }
    
}
