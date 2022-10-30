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
//        print("Id Item in Detail ItemView: \(idItem ?? "No Value")")
        titleLbl.text = traslate.internatiolization(keyText: "lcloading", commentText: "Loading")
        titleLbl.text = traslate.internatiolization(keyText: "lcloading", commentText: "Loading")
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
                    self?.detailCV.reloadData()
                }
            }
        }
    }
    
    func configureDetailView() {
        if idItem != nil {
            descriptionTextV.text = ""
            titleLbl.text = traslate.internatiolization(keyText: "lcloading", commentText: "Loading")
            subTitleLbl.text = traslate.internatiolization(keyText: "lcloading", commentText: "Loading")
            
            detailViewModel.retriveDataDetails(endPoint: endPoint.detailEnpoint, idMovie: idItem ?? "No value")
            self.detailCV.register(UINib(nibName: "MainElementCVViewCell", bundle: nil), forCellWithReuseIdentifier: "mainElement")
            
            self.detailCV.layer.cornerRadius = 5.0
            self.detailCV.layer.masksToBounds = true
            
            self.detailCV.dataSource = self
            self.detailCV.delegate = self
        } else {
            alert.showAlert(title: "Failure", message: "Error \(idItem ?? "No Value...!!!")", alertType: .failure)
        }

    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if navigationOPtion == "goHomeDetailHb"  {
            guard let goToViewStoryBoard = segue.destination as? HomeVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
        }
    }
}
