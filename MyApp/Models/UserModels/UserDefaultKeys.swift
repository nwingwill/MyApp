//
//  UserDefaultKeys.swift
//  MyApp
//
//  Created by nwing on 16/10/22.
//

import Foundation


extension UserDefaults {
    
    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }
    
    func isLoggedIn() -> Bool {
        
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        
    }
    
    //MARK: Retrieve Data
    func setUserUUID(value: String) {
        set(value, forKey: UserDefaultsKeys.userUUID.rawValue)
    }
    
    func getUserUUID() -> String {
        return string(forKey: UserDefaultsKeys.userUUID.rawValue) ?? ""
    }
    
    func setUserName(value: String) {
        set(value, forKey: UserDefaultsKeys.userName.rawValue)
    }
    
    func getUserName() -> String {
        return string(forKey: UserDefaultsKeys.userName.rawValue) ?? ""
    }
    
    func setUSerEmail(value: String) {
        set(value, forKey: UserDefaultsKeys.userEmail.rawValue)
    }
    
    func getUserEmail() -> String {
        return string(forKey: UserDefaultsKeys.userEmail.rawValue) ?? ""
    }

    
    func clearAllUSerDefaultsData(){
        let userDefaults = UserDefaults.standard
        let dics = userDefaults.dictionaryRepresentation()
        for key in dics {
            userDefaults.removeObject(forKey: key.key)
        }
        
        userDefaults.synchronize()
    }
    
    enum UserDefaultsKeys : String {
        case isLoggedIn
        case userUUID
        case userName
        case userEmail
    }
    
}


