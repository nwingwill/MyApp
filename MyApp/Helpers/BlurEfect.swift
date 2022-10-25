//
//  BlurEfect.swift
//  MyApp
//
//  Created by nwing on 24/10/22.
//

import Foundation
import UIKit

public class BlurEfect {
    
    func blurEffectView(view: UIView) {
        let blurEfect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEfect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        
        ])
    }
    
}
