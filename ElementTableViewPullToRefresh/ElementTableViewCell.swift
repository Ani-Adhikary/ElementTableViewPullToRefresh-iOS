//
//  ElementTableViewCell.swift
//  ElementTableView
//
//  Created by Ani Adhikary on 03/11/18.
//  Copyright © 2018 Ani Adhikary. All rights reserved.
//

import UIKit

class ElementTableViewCell: UITableViewCell {
    
    @IBOutlet var elementNameLabel: UILabel!    
    @IBOutlet var elementSymbolLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
