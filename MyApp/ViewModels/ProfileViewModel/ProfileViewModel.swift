//
//  ProfileViewModel.swift
//  MyApp
//
//  Created by nwing on 25/10/22.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseCore

class ProfileViewModel {
    
    var userManager = UserManagement()
    var alert = AlertMessengeHelperVC()
    
    var refreshData = {() -> () in }
    
    var debug = DebugManager(error: "", message: "")
    
    var itemsDetails : [DisplayableProtocol] = [] {
        didSet {
            refreshData()
        }
    }
    
    //    Fuente de datos (ARRAY)
    var item : [ProfileModel] = [] {
        didSet {
            refreshData()
        }
    }
    
    func retriveData(email: String) {
        
        let db = Firestore.firestore()
        
        db.collection("profile").document("\(email)").addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                //                print("Error fe")
                self.alert.showAlert(title: "Failure", message: "Fetching Document. \(error?.localizedDescription ?? "Unknow")", alertType: .failure)
                return
            }
            guard let data = document.data() else {
                self.alert.showAlert(title: "Failure", message: "Document data was empty. \(error?.localizedDescription ?? "Uknow")", alertType: .failure)
                return
            }
            //            let dataResult = data
            //            self.alert.showAlert(title: "Success", message: "Success, \(data)", alertType: .success)
            let nombre = data["nombre"] ?? "" as String
            let status = data["status"] ?? "" as String
            let userUID = data["userUID"] ?? "" as String
            let email = data["email"] ?? "" as String
            let address = data["address"] ?? "" as String
            let description = data["description"] ?? "" as String
            
            let itemAppend = ProfileModel(userUUID: userUID as? String, status: status as? String, nombre: nombre as? String, email: email as? String, address: address as? String, description: description as? String)
            self.item.append(itemAppend)
            self.itemsDetails = self.item
            print("resultas firebase query \(itemAppend)")
        }
    }
    
    func singOut() {
        
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
            UserDefaults.standard.clearAllUSerDefaultsData()
        } catch let singOutError as NSError {
            self.alert.showAlert(title: "Failure", message: "Fetching Document. \(singOutError.localizedDescription)", alertType: .failure)
        }
        
    }
    
}
