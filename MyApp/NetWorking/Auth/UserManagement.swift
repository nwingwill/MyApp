//
//  UserManagement.swift
//  MyApp
//
//  Created by nwing on 10/10/22.
//

import Foundation
import FirebaseCore
import FirebaseAuth

/// Allows user management
class UserManagement: UserManagementProtocol {
 
    var debug = DebugManager(error: "", message: "")
    var alert = AlertMessengeHelperVC()
    func logInAuth(email: String, password: String) {
        
        var userUUID: String = ""
        var userName: String = ""
        var msg : String = ""
        
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
            
//            guard let strongSelf = self else {return}
            
            if (authResult != nil) {
                self!.debug.debugMessage(error: "User UUID: \(String(describing: authResult?.user.uid)), \(String(describing: authResult?.user.providerID))", message: "Exito: ")
                userUUID = (authResult?.user.uid)!
//                userName = (authResult?.user.displayName)!
                    msg = authResult?.user.uid ?? ""
                    
                self!.alert.showAlert(title: "Success", message: "User UUID: \(msg)", alertType: .success)
                
            } else {
                msg = error?.localizedDescription ?? ""
                self!.alert.showAlert(title: "Failure", message: "error: \(msg)", alertType: .failure)
            }
        }
        
        
        
    }
    
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
