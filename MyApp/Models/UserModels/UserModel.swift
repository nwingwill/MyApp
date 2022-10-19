//
//  UserModel.swift
//  MyApp
//
//  Created by nwing on 16/10/22.
//

import Foundation

struct UserModel {

    var userUUID: String
    var userEmail: String
    var userName: String
    
    enum CodingKeys: String, CodingKey {
        case userUUID
        case userEmail
        case userName
    }
    
}


//extension UserModel {
//    var UUIDUser: String {
//        userUUID
//    }
//    
//    var userEmailEmail: String{
//        userEmail
//    }
//    
//    var userName: String {
//        userName
//    }
//}
