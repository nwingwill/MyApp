//
//  DebugManager.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation


class DebugManager {
    
    
    let error: String
    let message: String
    
    init(error: String, message: String) {
        self.error = error
        self.message = message
    }
    
    func debugMessage(error: String, message: String) {
        
        if error == "" {
            
            print("Debug: \(message)")
        } else {
            print("Debug: \(message), \(error)")
        }
    }
    
}
