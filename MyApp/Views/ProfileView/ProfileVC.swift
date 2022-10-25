//
//  ProfileVC.swift
//  MyApp
//
//  Created by nwing on 24/10/22.
//

import UIKit

class ProfileVC: UIViewController {

    
    //MARK: Oulets
    
    @IBOutlet weak var closeBtnLbl: UIButton!
    @IBOutlet var saveBtnLbl: UIView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Function
    
    @IBAction func closeBtn(_ sender: Any) {
    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
    }
    
    
    @IBAction func logOutBtn(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

    //MARK: Extensions
