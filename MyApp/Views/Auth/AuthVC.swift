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
    
    
    @IBOutlet weak var singIngBtn: UIButton!
    @IBOutlet weak var singUpBtn: UIButton!
    

    
    var traslate = LanguageManagement()
    var alert = AlertMessengeHelperVC()
    var registerManager = RegisterViewModel()
    var result: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        nameLbl.placeholder = traslate.internatiolization(keyText: "lcname", commentText: "Name")
        emailLbl.placeholder = traslate.internatiolization(keyText: "lcemail", commentText: "Email")
        passwodLbl.placeholder = traslate.internatiolization(keyText: "lcpassword", commentText: "Password")
        confirmPasswordLbl.placeholder = traslate.internatiolization(keyText: "lcconfirmpassw", commentText: "Confirm Password")
        
        singUpBtn.titleLabel?.text = traslate.internatiolization(keyText: "lcsingup", commentText: "Register")
        singIngBtn.titleLabel?.text = traslate.internatiolization(keyText: "lclogin", commentText: "Login")
        
        
//        languageManagement.internatiolization(keyText: <#T##String#>, commentText: <#T##String#>)
        
    }
    
    private func bind() {
        registerManager.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {

                self!.result = self!.registerManager.item
                if self!.result == true {
                    let secount = 3.0
                    DispatchQueue.main.asyncAfter(deadline: .now() + secount) {
                        
                        let identifierSegue = "gotoHomeAuth"
                        self!.performSegue(withIdentifier: "\(identifierSegue)", sender: self)
                    }
                }else{
                    self!.alert.showAlert(title: "Failure", message: "Error al acceder", alertType: .failure)
                }
            }
            
        }
    }
    
    
    @IBAction func singInBtn(_ sender: Any) {
        
        let identifierSegue = "goToLogIng"
        performSegue(withIdentifier: "\(identifierSegue)", sender: self)
        
    }
    @IBAction func singUpBtn(_ sender: Any) {
        
        if nameLbl.text == "" || emailLbl.text == "" || passwodLbl.text == "" || confirmPasswordLbl.text == "" {
            let message = traslate.internatiolization(keyText: "lcrequered", commentText: "Error Campos en blanco")
            alert.showAlert(title: "Failure", message: "\(message)", alertType: .failure)
        }else if passwodLbl.text != confirmPasswordLbl.text {
            let message = traslate.internatiolization(keyText: "lcequal", commentText: "Passwor diferentes")
            alert.showAlert(title: "Failure", message: "\(message)", alertType: .failure)
        }else{
            view.endEditing(true)
            registerManager.retriveData(nombre: nameLbl.text!, email: emailLbl.text!, password: passwodLbl.text!)
            bind()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "goToLogIng" {
            
            guard let goToViewStoryBoard = segue.destination as? LoginVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            
        }else if segue.identifier == "gotoHomeAuth" {
            
            guard let goToViewStoryBoard = segue.destination as? LoginVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            
        }
    }

    
}
