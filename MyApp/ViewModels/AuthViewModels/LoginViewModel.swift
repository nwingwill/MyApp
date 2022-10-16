//
//  LoginViewModel.swift
//  MyApp
//
//  Created by nwing on 16/10/22.
//

import Foundation


class LoginViewModel {
    
    var userManager = UserManagement()
    
    func login(email: String, password: String) {
        
        userManager.logInAuth(email: email, password: password)
        
    }
    
}
