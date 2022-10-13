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
    var segueText: String?
    
    var results : [ResultModel] = []
    var items : [DisplayableProtocol] = []
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configuereView()
        fetchResult()
    }
    
    func configuereView() {
        //        fetchResult()
        self.mainElementCV.register(UINib(nibName: "MainElementCVViewCell", bundle: nil), forCellWithReuseIdentifier: "mainElement")
        self.singleElmentTV.register(UINib(nibName: "SingleElementTVCell", bundle: nil), forCellReuseIdentifier: "singleElement")
        self.singleElmentTV.dataSource = self
        self.singleElmentTV.delegate = self
        self.mainElementCV.dataSource = self
        self.mainElementCV.delegate = self
        self.mainElementCV.reloadData()
        
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

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainElement", for: indexPath) as? MainElementCVViewCell
        let item = items[indexPath.row]
        let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
        cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
        cell?.titleLbl.text = item.titleLabelText
        return cell!
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "singleElement", for: indexPath) as? SingleElementTVCell
        let item = items[indexPath.row]
        let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
        cell?.singleImageView.sd_setImage(with: URL(string: imageUrl))
        cell?.titleLbl.text = item.titleLabelText
        cell?.detailTex.text = item.listTitle
        cell?.cost.text = "$\(item.item1)"
        
        return cell!
        
    }
    
}

extension HomeVC {
    
    func fetchResult(){
        //https://api.themoviedb.org/3/movie/now_playing?api_key=16dfbf948b4831d21068af2e750c66ee&language=en-US&page=1
        let baseurl = ConfigEnviroments.BASE_URL
        let endPoint = "/3/movie/now_playing?api_key="
        let parameter = "&language=en-US&page=1"
        let url = "\(baseurl)\(endPoint)\(ConfigEnviroments.API_KEY)\(parameter)"
        let request = AF.request("\(url)")
        
        
        request.responseDecodable  (of: AllResultModel.self) { (response) in
            
            if response.error != nil {
                print("Error en la consulta: \(response.error?.errorDescription ?? "...")")
            }else{
                
                guard let results = response.value else {return}
                self.results = results.results
                self.items = results.results
                self.mainElementCV.reloadData()
                self.singleElmentTV.reloadData()
                print("results: \(results.results)")
                print("Items: \(self.items.count)")
                print("url endpoint: \(url)")
            }
            
        }
        print("Items: \(self.items.count)")
        print("url endpoint: \(url)")
    }
    
    func urlImage(url: String){
        
        let transformer = SDImageResizingTransformer(size: CGSize(width: 150, height: 200), scaleMode: .fill)
        let imageView = UIImageView()
        //        var image = imageView.sd_setImage(with: URL(string: "\(imageUrl)"), placeholderImage: UIImage(named: "\(item.itemImage)"))
        let image: Void = imageView.sd_setImage(with: URL(string: "\(url)"), placeholderImage: nil, context: [.imageTransformer : transformer])
        //
        return image
        
    }
    
    func loadImgUrl(url: String) -> UIImage {
        
//        let imageUrlString = url
//        let imageUrl:URL = URL(string: imageUrlString)!
        var imageView = UIImage()
        let request = AF.request("\(url)")
        print("URL imagen: \(url)")
        request.responseDecodable  (of: AllResultModel.self) { (response) in
            
            if response.error != nil {
                print("Error en la consulta: \(response.error?.errorDescription ?? "...")")
            }else{
                
                guard let resultsData = response.data else {return}
                imageView = UIImage(data: resultsData as Data)!
                self.image = imageView
            }
            
        }
        //        imageView.sd_setImage(with: imageUrl, placeholderImage: nil)
        //        self.image = UIImage(imageView.sd_imageURL)
        
        
        // Start background thread so that image loading does not make app unresponsive
//        DispatchQueue.global(qos: .userInitiated).async {
//
//            let imageData:NSData = NSData(contentsOf: imageUrl)!
//            let imageUrl = UIImage(data: imageData as Data)
//            self.image = imageUrl!
//
//
//            // When from background thread, UI needs to be updated on main_queue
//            DispatchQueue.main.async {
//                let imageView = UIImageView(frame: CGRect(x:0, y:0, width:200, height:200))
//                imageView.center = self.view.center
//                let imageUrl = UIImage(data: imageData as Data)
//                self.image = imageUrl!
//                //                imageView.image = image
//                //               imageView.contentMode = UIView.ContentMode.scaleAspectFit
//                //                self.view.addSubview(imageView)
//            }
//        }
//        print("Images: \(self.image)")
        return self.image
    }
    
}
