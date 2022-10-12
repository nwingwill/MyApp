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

        // Configure the view for the selected state
    }
    
}
