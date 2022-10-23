//
//  DetailElementVC.swift
//  MyApp
//
//  Created by nwing on 20/10/22.
//

import UIKit

class DetailElementVC: UIViewController {
    
    
    var traslate = LanguageManagement()
    var endPoint = EndPoitModel()
    var segueText: String?
    

    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var goBackBtn: UIButton!
    
    @IBOutlet weak var descriptionTextV: UITextView!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    @IBOutlet weak var detailCV: UICollectionView!
    @IBOutlet weak var actionBtn: UIButton!
    
    var detailViewModel = DetailsViewModels()
    let logedIn = UserDefaults.standard.isLoggedIn()
    let navigationOPtion = ""
    var alert = AlertMessengeHelperVC()
    var idItem: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureDetailView()
        bind()
        
    }
    
    @IBAction func goBackBtn(_ sender: Any) {
        
        let navigationOPtion = "goHomeDetailHb"
        performSegue(withIdentifier: "\(navigationOPtion)", sender: self)
        
    }
    
    
    @IBAction func actionBtn(_ sender: Any) {
    }
    
    private func bind() {
        self.detailViewModel.refreshData = { [weak self] () in
            let count = self?.detailViewModel.itemsDetails.count
            if count == 1 {
                DispatchQueue.main.async {
                    
                    self?.configureDetailView()
                    self?.detailCV.reloadData()
                }
            }
        }
    }
    
    func configureDetailView() {
        descriptionTextV.text = ""
        titleLbl.text = ""
        

        if idItem == "" {
            titleLbl.text = "Error...!!!"
        } else {
            
            
            detailViewModel.retriveDataDetails(endPoint: endPoint.detailEnpoint, idMovie: idItem ?? "")
                self.detailCV.register(UINib(nibName: "MainElementCVViewCell", bundle: nil), forCellWithReuseIdentifier: "mainElement")
                self.detailCV.layer.cornerRadius = 5.0
                self.detailCV.layer.masksToBounds = true
            
                self.detailCV.dataSource = self
                self.detailCV.delegate = self
            let count = detailViewModel.itemsDetails.count
            print("Restul in view: \(count)")
            let detail = detailViewModel.itemsDetails
                for itemElement in detail {
                    titleLbl.text = itemElement.titleLabelText
                    
                    descriptionTextV.text = itemElement.subtitleLabelText
                    print("Result Query: \(itemElement.itemImage)")
            }
        }
    }
    
    
 
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
         
//
         
         if navigationOPtion == "goHomeDetailHb"  {
             guard let goToViewStoryBoard = segue.destination as? HomeVC else{return}
             goToViewStoryBoard.modalPresentationStyle = .fullScreen
             goToViewStoryBoard.dismiss(animated: true, completion: nil)
         }
         
     }
    
    
}

extension DetailElementVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailViewModel.itemsDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainElement", for: indexPath) as? MainElementCVViewCell
        let item = detailViewModel.itemsDetails[indexPath.row]
        cell?.titleLbl.text = item.titleLabelText
        if item.itemImage == "" {
            let imageUrl = "https://st.depositphotos.com/1000947/1749/i/600/depositphotos_17494035-stock-photo-creative-elegant-design-for-your.jpg"
            cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
//            cell?.titleLbl.text = item.titleLabelText
            
            let detail = detailViewModel.itemsDetails
                for itemElement in detail {
                    titleLbl.text = itemElement.titleLabelText
                    
                    descriptionTextV.text = itemElement.subtitleLabelText
                    print("Result Query: \(itemElement.itemImage)")
            }
            
        }else{
            let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
            cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
            cell?.titleLbl.text = ""
        }
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = 80 * collectionView.numberOfItems(inSection: 0)
        let totalSPacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)
        
        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSPacingWidth)) / 2
        let rigthInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rigthInset)
        
    }
}
