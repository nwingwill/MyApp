//
//  AuthVC.swift
//  MyApp
//
//  Created by nwing on 15/10/22.
//

import UIKit

class AuthVC: UIViewController {
    
    
    
    @IBOutlet weak var nameLbl: UITextField!
    @IBOutlet weak var passwodLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    
    @IBOutlet weak var confirmPasswordLbl: UITextField!
    
    @IBOutlet weak var singUpBtn: UIButton!
    

    var traslate = LanguageManagement()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func configView() {
        
        nameLbl.placeholder = traslate.internatiolization(keyText: "lcname", commentText: "Name")
        singUpBtn.titleLabel?.text = traslate.internatiolization(keyText: "lcsingin", commentText: "Sing In")
        
//        languageManagement.internatiolization(keyText: <#T##String#>, commentText: <#T##String#>)
        
    }

    @IBAction func singUpBtn(_ sender: Any) {
        
        
        
    }
    
}
