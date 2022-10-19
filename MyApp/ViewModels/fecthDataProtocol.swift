//
//  fecthDataProtocol.swift
//  MyApp
//
//  Created by nwing on 13/10/22.
//

import Foundation

protocol fecthDataProtocol {
    
    var dataDidChanges: ((Bool, Bool) -> Void)? { get set }
    
    func fetchResult()
}
