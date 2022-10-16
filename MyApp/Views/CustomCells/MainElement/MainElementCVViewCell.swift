//
//  MainElementCVViewCell.swift
//  MyApp
//
//  Created by nwing on 11/10/22.
//

import UIKit

class MainElementCVViewCell: UICollectionViewCell {

    @IBOutlet weak var mainImgImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mainImgImageView.layer.cornerRadius = 10.0
        self.mainImgImageView.layer.masksToBounds = true
        self.mainImgImageView.layer.shadowColor = UIColor.black.cgColor
        self.mainImgImageView.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.mainImgImageView.layer.shadowOpacity = 0.5
//        self.mainImgImageView.backgroundColor = UIColor.clear
        self.mainImgImageView.backgroundColor = UIColor.gray
        
        self.titleLbl.shadowColor = UIColor.white
        self.titleLbl.layer.shadowColor = UIColor.white.cgColor
        self.titleLbl.layer.cornerRadius = 10.0
    }

}
