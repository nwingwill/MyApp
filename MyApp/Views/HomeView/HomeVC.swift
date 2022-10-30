//
//  HomeVC.swift
//  MyApp
//
//  Created by nwing on 10/10/22.
//

import UIKit
import MapKit
import Alamofire
import SDWebImage
import SkeletonView

class HomeVC: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var singInOutBtn: UIButton!
    @IBOutlet weak var locationMV: MKMapView!
    @IBOutlet weak var mainElementCV: UICollectionView!
    @IBOutlet weak var singleElmentTV: UITableView!
    @IBOutlet weak var mainMenuContainerView: UIStackView!
    @IBOutlet weak var homeBtnLbl: UIButton!
    @IBOutlet weak var listLbl: UIButton!
    @IBOutlet weak var listShopBtnLbl: UIButton!
    @IBOutlet weak var productBtnList: UIButton!
    @IBOutlet weak var alertBtnList: UIButton!
    @IBOutlet weak var alertBtn: UIButton!
    
    //MARK: var and let
    var traslate = LanguageManagement()
    var endPoint = EndPoitModel()
    var segueText: String?
    var homeVieModel = HomeViewModel()
    var botomElemets = BottomElementViewModel()
    var topElements = TopElementViewModel()
    let logedIn = UserDefaults.standard.isLoggedIn()
    var navigationOPtion = ""
    var idItem = ""
    var alert = AlertMessengeHelperVC()
    var mainMenuConfig = MainMenuConfig()
    var buttonsConfig = ButtonsConfig()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        bindTop()
        bindBottom()
        
    }
    
    func configureView() {
        
        if  logedIn == true {
            
            let homeBtnLbl = buttonsConfig.configMenuButton(button: homeBtnLbl, name: "main-60")
            homeBtnLbl.isSkeletonable = true
            
            singInOutBtn.imageView?.image = UIImage(named: "gear-40")
            mainMenuContainerView.isHidden = false
            
            BlurEfect().blurEffectView(view: mainMenuContainerView)
            //goToProfile
            
        }else{
            singInOutBtn.imageView?.image = UIImage(named: "singin-40")
        }
        
        configuereViewTopElements()
        configureViewBotomElemts()
    }
    
    func configuereViewTopElements() {
        
        topElements.retriveDataTopList(endPoint: endPoint.trendingEndPoint)
        self.mainElementCV.register(UINib(nibName: "MainElementCVViewCell", bundle: nil), forCellWithReuseIdentifier: "mainElement")
        self.mainElementCV.layer.cornerRadius = 5.0
        self.mainElementCV.layer.masksToBounds = true
        
        
        self.mainElementCV.dataSource = self
        self.mainElementCV.delegate = self
        
    }
    
    func configureViewBotomElemts(){
        
        botomElemets.retriveDataEndPoint(endPoint: endPoint.nowPlayingEndpoint)
        self.singleElmentTV.register(UINib(nibName: "SingleElementTVCell", bundle: nil), forCellReuseIdentifier: "singleElement")
        
        self.singleElmentTV.layer.cornerRadius = 5.0
        self.singleElmentTV.layer.masksToBounds = true
        
        self.singleElmentTV.dataSource = self
        self.singleElmentTV.delegate = self
    }
    
    
    private func bind() {
        homeVieModel.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.mainElementCV.reloadData()
            }
            
        }
    }
    
    private func bindTop() {
        topElements.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.mainElementCV.reloadData()
            }
            
        }
    }
    
    private func bindBottom() {
        botomElemets.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.singleElmentTV.reloadData()
            }
            
        }
    }

    @IBAction func singInOutBtn(_ sender: UIButton) {
        
        if  logedIn == true {
            
            singInOutBtn.imageView?.image = UIImage(named: "gear-40")
//            UserDefaults.standard.clearAllUSerDefaultsData()
            performSegue(withIdentifier: "goToProfile", sender: self)
            
        }else{
            singInOutBtn.imageView?.image = UIImage(named: "singin-40")
            performSegue(withIdentifier: "goAuthSB", sender: self)
        }
    }
    
    @IBAction func productBtn(_ sender: Any) {
        listLbl.imageView?.image = UIImage(named: "list-29")
        
    }
    
    @IBAction func listShopBtn(_ sender: Any) {
        listShopBtnLbl.imageView?.image = UIImage(named: "shopping-29")
        performSegue(withIdentifier: "goToListElements", sender: self)
        print("goToListElements")
    }
    
    @IBAction func listBtn(_ sender: Any) {
    }
    
    @IBAction func homeBtn(_ sender: Any) {
        
        let listLbl = buttonsConfig.configMenuButton(button: listLbl, name: "list-29")//Ticket
        let listShopBtnLbl = buttonsConfig.configMenuButton(button: listShopBtnLbl, name: "shopping-29")//Shpping Car
        let productBtnList = buttonsConfig.configMenuButton(button: productBtnList, name: "calendar-29")//Calendar
        let alertBtnList = buttonsConfig.configMenuButton(button: alertBtnList, name: "bell_fill-29")//Alert
        
        if listLbl.isHidden == false || listShopBtnLbl.isHidden == false || productBtnList.isHidden == false || alertBtnList.isHidden == false {
            
            mainMenuConfig.animatedMAinButton(buton: listLbl, action: true, time: 0.3)
            mainMenuConfig.animatedMAinButton(buton: listShopBtnLbl, action: true, time: 0.4)
            mainMenuConfig.animatedMAinButton(buton: productBtnList, action: true, time: 0.5)
            mainMenuConfig.animatedMAinButton(buton: alertBtnList, action: true, time: 0.6)
            
        } else {
            
            mainMenuConfig.animatedMAinButton(buton: listLbl, action: false, time: 0.3)
            mainMenuConfig.animatedMAinButton(buton: listShopBtnLbl, action: false, time: 0.4)
            mainMenuConfig.animatedMAinButton(buton: productBtnList, action: false, time: 0.5)
            mainMenuConfig.animatedMAinButton(buton: alertBtnList, action: false, time: 0.6)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch navigationOPtion {
            
        case "goAuthSB":
            guard let goToViewStoryBoard = segue.destination as? LoginVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            break
            
        case "goToListElements":
            guard let goToViewStoryBoard = segue.destination as? ListDetailVC else{return}
            goToViewStoryBoard.idItem = idItem
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            break
            //goToProfile
        case "goToProfile":
            guard let goToViewStoryBoard = segue.destination as? ProfileVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            break
        //goToDetailElemets
        case "itemDetailSG":
            
            guard let goToViewStoryBoard = segue.destination as? ItemDetailVC else{return}
            goToViewStoryBoard.idItem = idItem
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            
            break
        default:
            break
        }
        
    }
    
}


