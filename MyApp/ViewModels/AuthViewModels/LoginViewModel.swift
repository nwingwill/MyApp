//
//  LoginViewModel.swift
//  MyApp
//
//  Created by nwing on 16/10/22.
//

import Foundation
import UIKit
import Firebase
import FirebaseCore
import FirebaseAuth
import FirebaseStorage
import FirebaseCore


class LoginViewModel {
    
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
    
    func retriveData(email: String, password: String) {
        
        var userUUID: String = ""
        let db = Firestore.firestore()
        let ref = db.collection("profile")
        
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
            
            if (authResult != nil) {
                
                userUUID = authResult?.user.uid ?? "No Value"
//                ref.document("\(email)")
                ref.document("\(email)").getDocument { (querySnapShot, error) in
                    
                    if let error = error {
                        self!.alert.showAlert(title: "Failure", message: "error: \(error.localizedDescription)", alertType: .failure)
                    } else {
                        if let nombre = querySnapShot?.get("nombre") {
                            
                            self!.alert.showAlert(title: "Exito", message: "Bienvenido... \(nombre)", alertType: .success)
                            UserDefaults.standard.setLoggedIn(value: true)
                            UserDefaults.standard.setUserName(value: "\(nombre)")
                            UserDefaults.standard.setUserUUID(value: "\(userUUID)")
                            UserDefaults.standard.setUSerEmail(value: "\(email)")
                            self!.item = true
                        }
                    }
                    
                }
//
            } else {
                let result = error?.localizedDescription ?? ""
                self!.alert.showAlert(title: "Failure", message: "error: \(result)", alertType: .failure)
            }
            
        }
    }
    
}
