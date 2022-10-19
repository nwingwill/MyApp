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
    
    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var appNameLbl: UILabel!
    
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
    
    
    @IBAction func productBtn(_ sender: Any) {
    }
    
    
    
    @IBAction func listShopBtn(_ sender: Any) {
    }
    
    
    @IBAction func listBtn(_ sender: Any) {
    }
    
    
    @IBAction func homeBtn(_ sender: Any) {
    }
    
    var traslate = LanguageManagement()
    var endPoint = EndPoitModel()
    var segueText: String?

    
    var homeVieModel = HomeViewModel()
    var botomElemets = BottomElementViewModel()
    var topElements = TopElementViewModel()
    let logedIn = UserDefaults.standard.isLoggedIn()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        bindTop()
        bindBottom()
        
    }
    
    func configureView() {
        
        singInOutBtn.imageView?.image = UIImage(named: "singin-29")
//        singInOutBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        if  logedIn == true {
//            singInOutBtn.isHidden = true
            singInOutBtn.imageView?.image = UIImage(systemName: "gear")
            UserDefaults.standard.removeObject(forKey: UserDefaults.UserDefaultsKeys.isLoggedIn.rawValue)
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
    
    
    /// <#Description#>
    /// - Parameter sender: <#sender description#>
    @IBAction func singInOutBtn(_ sender: UIButton) {
        

        if  logedIn == true {
            
            singInOutBtn.imageView?.image = UIImage(systemName: "gear")
            
        }
        
        performSegue(withIdentifier: "goAuthSB", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goAuthSB" {
            guard let goToViewStoryBoard = segue.destination as? LoginVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            
        }
    }
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Data array count: \(homeVieModel.items.count)")
        return topElements.itemsTop.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainElement", for: indexPath) as? MainElementCVViewCell
        //        let item = items[indexPath.row]
        let item = topElements.itemsTop[indexPath.row]
        if item.itemImage == "" {
            let imageUrl = "https://st.depositphotos.com/1000947/1749/i/600/depositphotos_17494035-stock-photo-creative-elegant-design-for-your.jpg"
            cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
        }else{
            let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
            
            cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
            
        }
        cell?.titleLbl.text = ""
        return cell!
    }
}


extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - section: <#section description#>
    /// - Returns: <#description#>
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - section: <#section description#>
    /// - Returns: <#description#>
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return botomElemets.itemsBotom.count
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - tableView: <#tableView description#>
    ///   - indexPath: <#indexPath description#>
    /// - Returns: <#description#>
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singleElement", for: indexPath) as? SingleElementTVCell
        //        let item = items[indexPath.row]
        let item = botomElemets.itemsBotom[indexPath.row]
        let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
        cell?.singleImageView.sd_setImage(with: URL(string: imageUrl))
        cell?.titleLbl.text = item.titleLabelText
        cell?.detailTex.text = item.listTitle
        cell?.cost.text = "$\(item.item1)"
        
        return cell!
        
    }
    

}

