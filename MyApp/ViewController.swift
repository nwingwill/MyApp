//
//  ViewController.swift
//  MyApp
//
//  Created by nwing on 9/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var appName = ConfigEnviroments.APP_NAME
    @IBOutlet weak var lblAppName: UILabel!
    var firebaseFile = ConfigEnviroments.FIREBASE_FILE_CONFIGURATION

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        print ("APP_NAME: \(firebaseFile)")
        
        lblAppName.text = internatiolization(keyText: "appTest", commentText: "App Name")
    }
    
    //Managment Languajes
    func internatiolization(keyText: String, commentText: String) -> String {
       return NSLocalizedString(keyText, comment: commentText)
    }

}

