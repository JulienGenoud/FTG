//
//  MyCustonCellCollectionViewCell.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 25/11/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class MyCustonCellCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate {
    
    @IBOutlet weak var ImageCell: UIImageView!
    @IBOutlet weak var LabelCell: UILabel!

    required init?(coder aDecoder: NSCoder) {
        //backgroundColor = UIColor.redColor()
        //print("dans init requiered")
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
//        print("dans awakefromnib")
        self.backgroundColor = UIColor.redColor()
        super.awakeFromNib()
        // Initialization code
    }
    
//init(frame: CGRect) {
//        super.init(frame: frame)
//        print("override init")
//    }
    
//    required init?(coder aDecoder: NSCoder) {
//        //print("ERORO DE MERDE")
//        fatalError("init(coder:) has not been implemented")
//    }
//    
}
