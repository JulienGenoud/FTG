//
//  IngredientAddTableViewCell.swift
//  CollectionTraining
//
//  Created by Julien Genoud on 05/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class IngredientAddTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
