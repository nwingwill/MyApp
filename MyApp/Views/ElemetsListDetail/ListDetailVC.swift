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
    let navigationOPtion = ""
    
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
        
        switch navigationOPtion {
            
        case "goHomeHb":
            guard let goToViewStoryBoard = segue.destination as? HomeVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            break
            
//        case "goToListElements":
//            guard let goToViewStoryBoard = segue.destination as? ListDetailVC else{return}
//            goToViewStoryBoard.modalPresentationStyle = .fullScreen
//            goToViewStoryBoard.dismiss(animated: true, completion: nil)
//            break
            
        default:
            break
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
        //        let item = items[indexPath.row]
        
//        cell?.frame.size = CGSize(width: 300, height: 150)
        let item = botomElemets.itemsBotom[indexPath.row]
        if item.itemImage == "" {
            let imageUrl = "https://st.depositphotos.com/1000947/1749/i/600/depositphotos_17494035-stock-photo-creative-elegant-design-for-your.jpg"
            cell?.singleImageView.sd_setImage(with: URL(string: imageUrl))
//            cell?.singleImageView.frame = CGRect(x: 0, y: 0, width: 120, height: 100)

        }else{
            let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
            cell?.singleImageView.sd_setImage(with: URL(string: imageUrl))
//            cell?.singleImageView.layer.cornerRadius = 10
        }
        cell?.titleLbl.text = item.titleLabelText
        cell?.detailTex.text = item.listTitle
        cell?.cost.text = "$\(item.idItem)"
        return cell!
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = botomElemets.itemsBotom[indexPath.row]
        print("Tapped: \(item.idItem)")
    }
}
