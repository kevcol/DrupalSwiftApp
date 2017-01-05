//
//  HeadlineCell.swift
//  DrupalPoweredApp
//
//  Created by Kevin Colligan on 1/5/17.
//  Copyright © 2017 Kevin Colligan. All rights reserved.
//

import UIKit

class HeadlineCell: UITableViewCell {
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImg.layer.cornerRadius = 5.0
        mainImg.clipsToBounds = true
    }
    
    func configureCell(image:UIImage, text: String) {
        mainImg.image = image
        mainLbl.text = text
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
