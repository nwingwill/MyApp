//
//  ExtensionDetailElementVC.swift
//  MyApp
//
//  Created by nwing on 28/10/22.
//

import Foundation
import UIKit

extension DetailElementVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailViewModel.itemsDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainElement", for: indexPath) as? MainElementCVViewCell
        let item = detailViewModel.itemsDetails[indexPath.row]
        print("Valor de IdItem in Detail Colection View: \(item.idItem)")
        let detail = detailViewModel.itemsDetails
        
        if detail.count == 0 {
            cell?.titleLbl.text = "No data"
        } else {
            
            if item.itemImage == "" {
                let imageUrl = "https://st.depositphotos.com/1000947/1749/i/600/depositphotos_17494035-stock-photo-creative-elegant-design-for-your.jpg"
                cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
                
                for itemElement in detail {
                    titleLbl.text = itemElement.titleLabelText
                    
                    descriptionTextV.text = itemElement.subtitleLabelText
                    print("Result Query: \(itemElement.itemImage)")
                }
                
            }else{
                let imageUrl = "https://image.tmdb.org/t/p/original\(item.itemImage)"
                cell?.mainImgImageView.sd_setImage(with: URL(string: imageUrl))
                cell?.titleLbl.text = ""
                for itemElement in detail {
                    titleLbl.text = itemElement.titleLabelText
                    
                    descriptionTextV.text = itemElement.subtitleLabelText
                    
                }
            }
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

