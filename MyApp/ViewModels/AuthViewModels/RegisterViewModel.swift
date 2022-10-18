//
//  RegisterViewModel.swift
//  MyApp
//
//  Created by nwing on 17/10/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseCore

class RegisterViewModel {
    
    var userManager = UserManagement()
    var alert = AlertMessengeHelperVC()
    
    var refreshData = {() -> () in }
    
    var debug = DebugManager(error: "", message: "")
    
    //    Fuente de datos (ARRAY)
    var item : Bool = false {
        didSet {
            refreshData()
        }
    }
    
    func retriveData(nombre: String, email: String, password: String) {
        
        var userUUID: String = ""
        let db = Firestore.firestore()
        
        let user = Auth.auth()
        
        user.createUser(withEmail: email, password: password) { createUserResult, error in
            
            if error != nil {
                
                self.alert.showAlert(title: "Failure", message: "\(user.currentUser?.email ?? "No value"),  \(error?.localizedDescription ?? "Unknown error...!!!")", alertType: .failure)
                
            }else{
                
                
                Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
                    
                    if (error != nil) {
                        
                        
                        let result = error?.localizedDescription ?? "Uknow Error"
                        self!.alert.showAlert(title: "Failure", message: "\(result)", alertType: .failure)
                        
                        
                    } else {
                        
                        userUUID = authResult?.user.uid ?? "No Value"
                        self!.alert.showAlert(title: "Exito", message: "Bienvenido... \(userUUID)", alertType: .success)
                        db.collection("profile").document(email).setData(["userUID":userUUID,"email": email,"nombre":nombre, "client": true,"status":"active"])
                        self!.alert.showAlert(title: "Exito", message: "Bienvenido... \(nombre)", alertType: .success)
                        UserDefaults.standard.setLoggedIn(value: true)
                        UserDefaults.standard.setUserName(value: nombre)
                        self!.item = true
                    }
                }
                
            }
        }
    }
}
