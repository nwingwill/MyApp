//
//  ViewController.swift
//  MyApp
//
//  Created by nwing on 9/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var appName = ConfigEnviroments.APP_NAME

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print ("APP_NAME: \(appName)")
    }


}

