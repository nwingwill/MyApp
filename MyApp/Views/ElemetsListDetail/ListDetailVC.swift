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
        configureView()
        bindBottom()
    }
    
    func configureView() {
        
        configureViewBotomElemts()
    }
    
    private func bindBottom() {
        botomElemets.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.singleElmentListTV.reloadData()
            }
            
        }
    }
    
    func configureViewBotomElemts(){
        //Thread 1: Fatal error: Unexpectedly found nil while implicitly unwrapping an Optional value
        botomElemets.retriveDataEndPoint(endPoint: endPoint.nowPlayingEndpoint)
        self.singleElmentListTV.register(UINib(nibName: "SingleElementTVCell", bundle: nil), forCellReuseIdentifier: "singleElement")
        
        self.singleElmentListTV.layer.cornerRadius = 5.0
        self.singleElmentListTV.layer.masksToBounds = true
        
        self.singleElmentListTV.dataSource = self
        self.singleElmentListTV.delegate = self
    }
    
    
    
//    @IBAction func homeBtnLbl(_ sender: Any) {
//        let navigationOPtion = "ElementListDetailSB"
//        self.performSegue(withIdentifier: "\(navigationOPtion)", sender: self)
//    }
    
    @IBAction func gotoHomeBtn(_ sender: Any) {
        let navigationOPtion = "goHomeHb"
        self.performSegue(withIdentifier: "\(navigationOPtion)", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if navigationOPtion == "goHomeHb"  {
            guard let goToViewStoryBoard = segue.destination as? HomeVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
        } else if navigationOPtion == "goListToDetailSG" {
//            guard let goToViewStoryBoard = segue.destination as? DetailElementVC else{return}
            let destinationVC : DetailElementVC = segue.destination as! DetailElementVC
            
            print("idItem = \(idItem!)")
            destinationVC.idItem = idItem
            destinationVC.modalPresentationStyle = .fullScreen
            destinationVC.dismiss(animated: true, completion: nil)
            
        }
        
    }

}

extension ListDetailVC: UITableViewDelegate, UITableViewDataSource {
    
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
        let item = botomElemets.itemsBotom[indexPath.row]
        if item.itemImage == "" {
            
            let imageUrl = "https://st.depositphotos.com/1000947/1749/i/600/depositphotos_17494035-stock-photo-creative-elegant-design-for-your.jpg"
            cell?.singleImageView.sd_setImage(with: URL(string: imageUrl))
            cell?.singleImageView.layer.cornerRadius = 10

        }else{
            
            let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
            cell?.singleImageView.sd_setImage(with: URL(string: imageUrl))
            cell?.singleImageView.layer.cornerRadius = 10
        }
        
        cell?.titleLbl.text = item.titleLabelText
        cell?.detailTex.text = item.listTitle
        cell?.cost.text = "$\(item.idItem)"
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = botomElemets.itemsBotom[indexPath.row]
        navigationOPtion = "goListToDetailSG"
        idItem = item.idItem
        if idItem != "" {
            performSegue(withIdentifier: "\(navigationOPtion)", sender: idItem)
//            print("sender: \(sender)")
        }else {
            alert.showAlert(title: "Failure", message: "No id Selected", alertType: .failure)
        }
    }
}
