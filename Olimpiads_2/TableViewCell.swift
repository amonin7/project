//
//  TableViewCell.swift
//  Olimpiads_2
//
//  Created by Антон Шуплецов on 10/12/2018.
//  Copyright © 2018 Антон Шуплецов. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameOfOlimpiad: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
