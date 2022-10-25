//
//  LanguageManagement.swift
//  MyApp
//
//  Created by nwing on 10/10/22.
//

import Foundation

/// Allows translation of label titles into other languages
class LanguageManagement {
    
    /// Allows translation of label titles into other languages
    /// - Parameters:
    ///   - keyText: identifier for the text to translate
    ///   - commentText: Text to translate
    /// - Returns: String with text language according to system configuration
    func internatiolization(keyText: String, commentText: String) -> String {
       return NSLocalizedString(keyText, comment: commentText)
    }
    
}
