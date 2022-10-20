//
//  SingleElementTVCell.swift
//  MyApp
//
//  Created by nwing on 11/10/22.
//

import UIKit

class SingleElementTVCell: UITableViewCell {

    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var detailTex: UITextView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var singleImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.singleImageView.layer.cornerRadius = 10.0
        self.singleImageView.layer.masksToBounds = true
        self.singleImageView.layer.shadowColor = UIColor.black.cgColor
//        self.singleImageView.frame = CGRectMake(0, 0, 50, 100)
        self.titleLbl.shadowColor = UIColor.white
        self.titleLbl.layer.shadowColor = UIColor.white.cgColor
        self.titleLbl.layer.cornerRadius = 10.0
        self.singleImageView.layer.masksToBounds = true
        
    }
    
}
