//
//  ViewController.swift
//  MyApp
//
//  Created by nwing on 9/10/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class ViewController: UIViewController {
    
    var appName = ConfigEnviroments.APP_NAME
    @IBOutlet weak var lblAppName: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        print ("APP_NAME: \(firebaseFile)")
        
        lblAppName.text = internatiolization(keyText: "appTest", commentText: "App Name")
        
        
        
        Auth.auth().createUser(withEmail: "nestorwblancog@gmail.com", password: "AdminAdmi") { authResult, error in
            
            if (authResult != nil){
                print("Exito...!!!")
            }else{
                print("Error, \(String(describing: error?.localizedDescription))")
            }
            
        }
    }
    
    //Managment Languajes
    func internatiolization(keyText: String, commentText: String) -> String {
       return NSLocalizedString(keyText, comment: commentText)
    }

}

