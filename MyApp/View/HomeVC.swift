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

class HomeVC: UIViewController {
    
    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var loginImgView: UIImageView!
    @IBOutlet weak var appNameLbl: UILabel!
    
    @IBOutlet weak var locationMV: MKMapView!
    @IBOutlet weak var mainElementCV: UICollectionView!
    
    @IBOutlet weak var singleElmentTV: UITableView!
    
    var traslate = LanguageManagement()
    var endPoint = EndPoitModel()
    var segueText: String?
    
    //    var results : [ResultModel] = []
    //    var items : [DisplayableProtocol] = []
    //    var image = UIImage()
    
    var homeVieModel = HomeViewModel()
    var botomElemets = BottomElementViewModel()
    var topElements = TopElementViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        configuereView()
        configuereViewTopElements()
        configureViewBotomElemts()
        bindTop()
        bindBottom()
        
    }
    
    func configuereView() {
        homeVieModel.retriveDataList()
        self.mainElementCV.register(UINib(nibName: "MainElementCVViewCell", bundle: nil), forCellWithReuseIdentifier: "mainElement")
        //        self.singleElmentTV.register(UINib(nibName: "SingleElementTVCell", bundle: nil), forCellReuseIdentifier: "singleElement")
        
        //        self.singleElmentTV.layer.cornerRadius = 5.0
        self.mainElementCV.layer.cornerRadius = 5.0
        //        self.singleElmentTV.layer.masksToBounds = true
        self.mainElementCV.layer.masksToBounds = true
        
        //        self.singleElmentTV.dataSource = self
        //        self.singleElmentTV.delegate = self
        self.mainElementCV.dataSource = self
        self.mainElementCV.delegate = self
        
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
    
//    func dataSourece() {
//        homeVieModel.retriveDataEndPoint(endPoint: endPoint.popularEndpoint)
//    }
    
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
        let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
        cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
        cell?.titleLbl.text = item.titleLabelText
        return cell!
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return botomElemets.itemsBotom.count
    }
    
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

//extension HomeVC {
//
//    func fetchResult() {
//        homeVieModel.fetch_Result()
//    }
//
//    func prepareViewModelObserver() {
//        self.homeVieModel.dataDidChanges = { (finished, error) in
//            if !error {
//                self.reloadData()
//            }
//        }
//    }
//
//    func reloadData() {
//        self.singleElmentTV.reloadData()
//        self.mainElementCV.reloadData()
//    }
//}

//extension HomeVC {
//
//    func fetchResult(){
//        //https://api.themoviedb.org/3/movie/now_playing?api_key=16dfbf948b4831d21068af2e750c66ee&language=en-US&page=1
//        let baseurl = ConfigEnviroments.BASE_URL
//        let endPoint = "/3/movie/now_playing?api_key="
//        let parameter = "&language=en-US&page=1"
//        let url = "\(baseurl)\(endPoint)\(ConfigEnviroments.API_KEY)\(parameter)"
//        let request = AF.request("\(url)")
//
//
//        request.responseDecodable  (of: AllResultModel.self) { (response) in
//
//            if response.error != nil {
//                print("Error en la consulta: \(response.error?.errorDescription ?? "...")")
//            }else{
//
//                guard let results = response.value else {return}
//                self.results = results.results
//                self.items = results.results
//                self.mainElementCV.reloadData()
//                self.singleElmentTV.reloadData()
//                print("results: \(results.results)")
//                print("Items: \(self.items.count)")
//                print("url endpoint: \(url)")
//            }
//
//        }
//        print("Items: \(self.items.count)")
//        print("url endpoint: \(url)")
//    }
//
//}
