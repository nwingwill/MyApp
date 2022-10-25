//
//  UserManagementProtocol.swift
//  MyApp
//
//  Created by nwing on 10/10/22.
//

import Foundation

/// Protocol for user management
protocol UserManagementProtocol {
    
    /// Allows the creation of users
    /// - Parameters:
    ///   - email: Email to create the user
    ///   - password: Password
    /// - Returns: Returns true if the registration is successful
    func createUser(email: String, password: String) -> Bool
    
    func logInAuth(email: String, password: String)
}
