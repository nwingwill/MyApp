//
//  CreateUser.swift
//  MyApp
//
//  Created by nwing on 10/10/22.
//

import Foundation
import FirebaseCore
import FirebaseAuth


/// <#Description#>
class CreateUser: ProtocolCreateUser {
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - email: <#email description#>
    ///   - password: <#password description#>
    /// - Returns: <#description#>
    func createUser(email: String, password: String) -> Bool {
        var result : Bool = false
        
        Auth.auth().createUser(withEmail: "nestorwblancog@gmail.com", password: "AdminAdmi") { authResult, error in

            if (authResult != nil){
                result = true
                print("Exito...!!!")
            }else{
                result = false
                print("Error, \(String(describing: error?.localizedDescription))")
            }
        }
        return result
    }
    
}
