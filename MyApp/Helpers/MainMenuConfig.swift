//
//  MainMenuConfig.swift
//  MyApp
//
//  Created by nwing on 24/10/22.
//

import Foundation
import UIKit

class MainMenuConfig {
    
    func animatedMAinButton(buton: UIButton, action: Bool, time: Double) {
        UIView.transition(with: buton, duration: time, options: .transitionCrossDissolve) {
            buton.isHidden = action
        }
    }
}
