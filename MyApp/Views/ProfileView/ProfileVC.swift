//
//  ProfileVC.swift
//  MyApp
//
//  Created by nwing on 24/10/22.
//

import UIKit
import Alamofire
import SDWebImage
import SkeletonView

class ProfileVC: UIViewController {

    
    //MARK: Oulets
    
    @IBOutlet weak var closeBtnLbl: UIButton!
//    @IBOutlet var saveBtnLbl: UIView!
    
    @IBOutlet weak var saveBtnLbl: UIButton!
    @IBOutlet weak var imgBackGroundImgView: UIImageView!
    @IBOutlet weak var imgProfileImgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var addressInput: UITextField!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var logOutBtnLbl: UIButton!
    
    //MARK: var and let
    var traslate = LanguageManagement()
    var endPoint = EndPoitModel()
    var segueText: String?
    var homeVieModel = HomeViewModel()
    var botomElemets = BottomElementViewModel()
    var topElements = TopElementViewModel()
    let logedIn = UserDefaults.standard.isLoggedIn()
    let navigationOPtion = ""
    var alert = AlertMessengeHelperVC()
    var mainMenuConfig = MainMenuConfig()
    var buttonsConfig = ButtonsConfig()
    var profileViewModel = ProfileViewModel()
    let emailUser = UserDefaults.standard.getUserEmail()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        configView()
        bind()
        configProfileView()
        
    }
    
    //MARK: Function
    func configProfileView() {
        
        profileViewModel.retriveData(email: "\(emailUser)")

        saveBtnLbl.titleLabel?.text = traslate.internatiolization(keyText: "lcSave", commentText: "Save")
        logOutBtnLbl.titleLabel?.text = traslate.internatiolization(keyText: "lcLogOut", commentText: "Log Out")
    
        nameLbl.text = traslate.internatiolization(keyText: "lcname", commentText: "Name")
        nameInput.placeholder = traslate.internatiolization(keyText: "lcname", commentText: "Name")
        
        emailLbl.text = traslate.internatiolization(keyText: "lcEmail", commentText: "Email")
        emailInput.text = "\(emailUser)"
        
        addressLbl.text = traslate.internatiolization(keyText: "lcAddress", commentText: "Address")
        addressInput.placeholder = traslate.internatiolization(keyText: "lcAddInfo", commentText: "Address")
        
        descriptionLbl.text = traslate.internatiolization(keyText: "lcDescription", commentText: "Description")
        descriptionInput.placeholder = traslate.internatiolization(keyText: "lcAddInfo", commentText: "Description")
        
    }
    
    private func bind() {
        self.profileViewModel.refreshData = { [weak self] () in
            
            for item in self!.profileViewModel.itemsDetails {
                self!.nameInput.text = item.titleLabelText
                self!.addressInput.text = item.subtitleLabelText
                self!.descriptionInput.text = item.listTitle
//                self.
            }
            
//            DispatchQueue.main.async {
//                self.profileViewModel.relo
//                self.profileViewModel.item.
                
                
//            }
            
        }
    }
    
    func setupTextInput(textInput: UITextField) {

        textInput.borderStyle = .none
        textInput.borderStyle = .bezel
//        let underline = CALayer()
//        let lineWidth : CGFloat = 1.0
//
//        underline.borderColor = UIColor.gray.cgColor
//        underline.frame = CGRect(
//            x:0,
//            y: frame.size.width,
//            width: frame.size.width,
//            height: frame.size.height
//        )

    }
    
    @IBAction func closeBtn(_ sender: Any) {
        performSegue(withIdentifier: "goProfileToMain", sender: self)
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
        
    }
    
    
    @IBAction func logOutBtn(_ sender: Any) {
        
        logOutBtnLbl.titleLabel?.text = traslate.internatiolization(keyText: "lcLogOut", commentText: "Log Out")
        profileViewModel.singOut()
        
        performSegue(withIdentifier: "goProfileToMain", sender: self)
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let goToViewStoryBoard = segue.destination as? HomeVC else{return}
        goToViewStoryBoard.modalPresentationStyle = .fullScreen
        goToViewStoryBoard.dismiss(animated: true, completion: nil)
        
    }
    
}

    //MARK: Extensions
