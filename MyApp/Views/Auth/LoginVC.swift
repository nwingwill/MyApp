//
//  LoginVC.swift
//  MyApp
//
//  Created by nwing on 16/10/22.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailLbl: UITextField!
    
    @IBOutlet weak var passwordLbl: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var singUpBtn: UIButton!
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var infoLbl: UILabel!
    
    
   
    @IBOutlet weak var googleLogInBtn: UIButton!
    
    @IBOutlet weak var facbookLogInBtn: UIButton!
    
    var usermanager = LoginViewModel()
    
    var traslate = LanguageManagement()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func configureView() {
    
        emailLbl.placeholder = traslate.internatiolization(keyText: "lcemail", commentText: "email")
        passwordLbl.placeholder = traslate.internatiolization(keyText: "lcpassword", commentText: "Password")
        
        singUpBtn.titleLabel?.text = traslate.internatiolization(keyText: "lcsingup", commentText: "Register")
        loginBtn.titleLabel?.text = traslate.internatiolization(keyText: "lclogin", commentText: " Login")
        infoLbl.text = traslate.internatiolization(keyText: "lcinfo", commentText: "Info App")
        googleLogInBtn.titleLabel?.text = traslate.internatiolization(keyText: "lcgoogle", commentText: "Sing In Google")
        
        facbookLogInBtn.titleLabel?.text = traslate.internatiolization(keyText: "lcfacebook", commentText: "Facebook Login")

        
    }
    
    
    @IBAction func singUp(_ sender: Any) {
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
//        usermanager.logInAuth(email: emailLbl.text!, password: passwordLbl.text!)
        usermanager.login(email: emailLbl.text!, password: passwordLbl.text!)
//        print("Email: \(emailLbl.text), password: \(passwordLbl.text)")
        
    }
    
    @IBAction func facebookLogInBtn(_ sender: Any) {
    }
    
    @IBAction func googleLogInBtn(_ sender: Any) {
    }
}
