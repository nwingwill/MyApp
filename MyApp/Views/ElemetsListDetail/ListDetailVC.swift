//
//  ListDetailVC.swift
//  MyApp
//
//  Created by nwing on 20/10/22.
//

import UIKit

class ListDetailVC: UIViewController {
    
    @IBOutlet weak var goToHomeBtn: UIBarButtonItem!
    
    @IBOutlet weak var singleElmentListTV: UITableView!
    
    var traslate = LanguageManagement()
    var endPoint = EndPoitModel()
    var segueText: String?
    
    var homeVieModel = HomeViewModel()
    var botomElemets = BottomElementViewModel()
    var topElements = TopElementViewModel()
    let logedIn = UserDefaults.standard.isLoggedIn()
    var navigationOPtion = ""
    var idItem : String?
    var alert = AlertMessengeHelperVC()
    
    @IBOutlet weak var homeBtnLbl: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        if idItem != nil {
//            navigationOPtion = "goListToDetailSG"
////            performSegue(withIdentifier: "\(navigationOPtion)", sender: self)
//            navigationOption()
//        }else{
            
            configureView()
            bindBottom()
//        }
    }
    
    func configureView() {
//        if idItem != nil{
//            print("Continuar aca, idItem = \(idItem ?? "No Value...!!!")")
//            navigationOPtion = "goListToDetailSG"
////            idItem = item.idItem
//                performSegue(withIdentifier: "\(navigationOPtion)", sender: self)
//
////            guard let viewController = UIStoryboard(name: "ElementListDetailSB", bundle: nil).instantiateViewController(withIdentifier: "DetailElementSB") as? DetailElementVC else {
////                print("Coult not instatiate view controller with identifier")
////                return
////            }
////                viewController.idItem = self.idItem
////            print("idItemValue: \(self.idItem ?? "No Data Value")")
////    //            viewController.resultArray = self.resultArray
////            self.navigationController?.pushViewController(viewController, animated: true)
//        } else {
            
            configureViewBotomElemts()
//        }
        
    }
    
    private func bindBottom() {
        botomElemets.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.singleElmentListTV.reloadData()
            }
            
        }
    }
    
    func configureViewBotomElemts(){
       
        botomElemets.retriveDataEndPoint(endPoint: endPoint.nowPlayingEndpoint)
        self.singleElmentListTV.register(UINib(nibName: "SingleElementTVCell", bundle: nil), forCellReuseIdentifier: "singleElement")
        
        self.singleElmentListTV.layer.cornerRadius = 5.0
        self.singleElmentListTV.layer.masksToBounds = true
        
        self.singleElmentListTV.dataSource = self
        self.singleElmentListTV.delegate = self
    }
    
    @IBAction func gotoHomeBtn(_ sender: Any) {
        let navigationOPtion = "goHomeHb"
        self.performSegue(withIdentifier: "\(navigationOPtion)", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch navigationOPtion {

        case "goHomeHb":

            guard let goToViewStoryBoard = segue.destination as? HomeVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            break

//        case "goListToDetailSG":
//
//            guard let destinationVC : DetailElementVC = segue.destination as? DetailElementVC else {return}
//            destinationVC.idItem = idItem
//            destinationVC.modalPresentationStyle = .fullScreen
//            destinationVC.dismiss(animated: true, completion: nil)
//         //goToItemDetail
//            break

        case "goToItemDetail":

            guard let goToViewStoryBoard = segue.destination as? ItemDetailVC else{return}
            goToViewStoryBoard.idItem = idItem
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)

            break

        default:
            print("Fail...!!!!")
            break
        }
    }
    
}

