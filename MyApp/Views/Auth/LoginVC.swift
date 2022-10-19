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
    var alert = AlertMessengeHelperVC()
    var userModel = [UserModel]()

    
    var result: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureView()
    }
    

    /*showLoginHomeAuth
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
    
    
    private func bind() {
        usermanager.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {
//                self?.mainElementCV.reloadData()
//                UserDefaults.standard.isLoggedIn()
//                self?.usermanager.items
//                self?.userModel.append(contentsOf: self!.usermanager.item)
                self!.result = self!.usermanager.item
                if self!.result == true {
                    let secount = 3.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + secount) {
                        
                        let identifierSegue = "showLoginHomeAuth"
                        self!.performSegue(withIdentifier: "\(identifierSegue)", sender: self)
                    }
                }else{
                    self!.alert.showAlert(title: "Failure", message: "Error al acceder", alertType: .failure)
                }
            }
            
        }
    }
    
    @IBAction func singUp(_ sender: Any) {
        
        let identifierSegue = "goRegisterSB"
        performSegue(withIdentifier: "\(identifierSegue)", sender: self)
//
    }
    
    @IBAction func loginBtn(_ sender: Any) {

        usermanager.retriveData(email: emailLbl.text!, password: passwordLbl.text!)

//        let secount = 3.0
//        DispatchQueue.main.asyncAfter(deadline: .now() + secount) {
            bind()
//        }
        
    }
    
    @IBAction func facebookLogInBtn(_ sender: Any) {
    }
    
    @IBAction func googleLogInBtn(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showLoginHomeAuth" {
            guard let goToViewStoryBoard = segue.destination as? HomeVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            
        }else if segue.identifier == "goRegisterSB" {
            guard let goToViewStoryBoard = segue.destination as? AuthVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
        }
    }
}
