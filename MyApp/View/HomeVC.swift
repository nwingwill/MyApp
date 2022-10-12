//
//  HomeVC.swift
//  MyApp
//
//  Created by nwing on 10/10/22.
//

import UIKit
import MapKit

class HomeVC: UIViewController {

    @IBOutlet weak var logoImgView: UIImageView!
    @IBOutlet weak var loginImgView: UIImageView!
    @IBOutlet weak var appNameLbl: UILabel!
    
    @IBOutlet weak var locationMV: MKMapView!
    @IBOutlet weak var mainElementCV: UICollectionView!
    
    @IBOutlet weak var singleElmentTV: UITableView!
    
    var traslate = LanguageManagement()
    var segueText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        appNameLbl.text = traslate.internatiolization(keyText: "lcwelcome", commentText: "Bienvenido")
        self.mainElementCV.register(UINib(nibName: "MainElementCVViewCell", bundle: nil), forCellWithReuseIdentifier: "mainElement")
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
        
        return 3
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainElement", for: indexPath) as? MainElementCVViewCell
        cell?.titleLbl.text = "Exito"
//        cell?.mainImgImageView.image = UIImage(named: "nwingShadows")
        return cell!
    }
}
