//
//  ButtonsConfig.swift
//  MyApp
//
//  Created by nwing on 24/10/22.
//

import Foundation
import UIKit

class ButtonsConfig {
    
    func configMenuButton(button: UIButton, name: String) -> UIButton {
        button.imageView?.image = UIImage(named: "\(name)")
        button.imageView?.layer.borderColor = UIColor.white.cgColor
//        button.backgroundColor = UIColor.gray.lighter
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        return button
    }
    
}
