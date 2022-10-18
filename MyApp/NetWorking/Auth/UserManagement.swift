//
//  UserManagement.swift
//  MyApp
//
//  Created by nwing on 10/10/22.
//

import Foundation
import FirebaseCore
import FirebaseAuth
//import Rx

/// Allows user management
class UserManagement: UserManagementProtocol {
    
 
    var debug = DebugManager(error: "", message: "")
    var alert = AlertMessengeHelperVC()
    var userModel = UserModel(userUUID: "", userEmail: "", userName: "")
    var result: String = ""
    
    
    func logInAuth(email: String, password: String) {
        
        var userUUID: String = ""

        Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
            
            if (authResult != nil) {
                
                userUUID = authResult?.user.uid ?? "No Value"
                self!.alert.showAlert(title: "Exito", message: "Bienvenido... \(userUUID)", alertType: .success)
//                UserDefaults.standard.setLoggedIn(value: true)
//                self!.resultado()
            } else {
                let result = error?.localizedDescription ?? ""
                self!.alert.showAlert(title: "Failure", message: "error: \(result)", alertType: .failure)
            }
            
        }
        return
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
