//
//  ExtensionListDetailVC.swift
//  MyApp
//
//  Created by nwing on 28/10/22.
//

import Foundation
import UIKit

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
        navigationOPtion = "goToItemDetail"
        idItem = item.idItem
        
        if idItem != "" {
            
            
//            let storyBoard = UIStoryboard(name: "ElementDetailSB", bundle: nil)
//            let detailView : ItemDetailVC = storyBoard.instantiateViewController(withIdentifier: "itemDetailSB") as! ItemDetailVC
//            detailView.idItem = idItem
            performSegue(withIdentifier: "\(navigationOPtion)", sender: idItem!)
//            detailView.presentedViewController?.present(detailView, animated: true)
//            print("Id Item in selction cell: \(idItem!)")
            
        }else {
            alert.showAlert(title: "Failure", message: "No id Selected", alertType: .failure)
        }
    }
}

