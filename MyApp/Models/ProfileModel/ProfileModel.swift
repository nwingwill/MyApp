//
//  ProfileModel.swift
//  MyApp
//
//  Created by nwing on 25/10/22.
//

import Foundation

struct ProfileModel: Codable {
    let userUUID: String?
    let status: String?
    let nombre: String?
    let email: String?
    let address: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case userUUID
        case status
        case nombre
        case email
        case address
        case description
    }
    
}

extension ProfileModel: DisplayableProtocol {
    
    var titleLabelText: String {
        (nombre ?? "")
    }
    
    var subtitleLabelText: String {
        (address ?? "")
    }
    
    var item1: (label: String, value: String) {
        ("", "")
    }
    
    var listTitle: String {
        (description ?? "")
    }
    
    var itemImage: String {
        ""
    }
    
    var listItems: [Int] {
        []
    }
    
    var idItem: String {
        ""
    }
    
    
}
