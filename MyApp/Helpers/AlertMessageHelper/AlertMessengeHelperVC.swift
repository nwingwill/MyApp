//
//  AlertMessengeHelperVC.swift
//  MyApp
//
//  Created by nwing on 16/10/22.
//

import UIKit

class AlertMessengeHelperVC: UIView {
    
    @IBOutlet weak var alertMsgViewHelper: UIView!
    @IBOutlet var parentViewMsgHelper: UIView!
    @IBOutlet weak var imgConfirmMsgHelper: UIImageView!
    
    @IBOutlet weak var messageLblMsgHelper: UILabel!
    
    @IBOutlet weak var confirmLblMsgHelper: UILabel!
    
    @IBOutlet weak var confirmBtnMsgHelper: UIButton!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertMessengeHelperVC", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        imgConfirmMsgHelper.layer.cornerRadius = 30
        imgConfirmMsgHelper.layer.borderColor = UIColor.white.cgColor
        imgConfirmMsgHelper.layer.borderWidth = 2
        
        alertMsgViewHelper.layer.cornerRadius = 10
        
        parentViewMsgHelper.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentViewMsgHelper.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    enum AlertType {
        case success
        case failure
    }
    
    func showAlert(title: String, message: String, alertType: AlertType) {
        self.confirmLblMsgHelper.text = title
        self.messageLblMsgHelper.text = message
        
        switch alertType {
        case .success:
            imgConfirmMsgHelper.image = UIImage(named: "Success")
            confirmBtnMsgHelper.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case .failure:
            imgConfirmMsgHelper.image = UIImage(named: "Failure")
            confirmBtnMsgHelper.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
        UIApplication.shared.keyWindow?.addSubview(parentViewMsgHelper)
    }
    
    @IBAction func confirmBtnMsgHelper(_ sender: Any) {
        
        parentViewMsgHelper.removeFromSuperview()
        
    }
    
    
}
