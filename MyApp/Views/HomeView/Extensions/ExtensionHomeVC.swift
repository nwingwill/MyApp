//
//  ExtensionHomeVC.swift
//  MyApp
//
//  Created by nwing on 28/10/22.
//

import Foundation
import UIKit
import MapKit
import Alamofire
import SDWebImage
import SkeletonView

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
            cell?.titleLbl.text = item.titleLabelText
        }else{
            let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
            
            cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
            cell?.titleLbl.text = ""
        }
        
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = topElements.itemsTop[indexPath.row]
        print("Taped.: \(item.idItem)")
        
        
//        let item = botomElemets.itemsBotom[indexPath.row]
//        goToListElements
//        itemDetailSG
        navigationOPtion = "itemDetailSG"
        idItem = item.idItem
        if idItem != "" {
            performSegue(withIdentifier: "\(navigationOPtion)", sender: idItem)
//            print("sender: \(sender)")
        }else {
            alert.showAlert(title: "Failure", message: "No id Selected", alertType: .failure)
        }
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
        
//        let item = botomElemets.itemsBotom[indexPath.row]
        navigationOPtion = "itemDetailSG"
        idItem = item.idItem
        if idItem != "" {
            performSegue(withIdentifier: "\(navigationOPtion)", sender: idItem)
        }else {
            alert.showAlert(title: "Failure", message: "No id Selected", alertType: .failure)
        }

        
    }
}
