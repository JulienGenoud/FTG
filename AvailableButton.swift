//
//  AvailableButton.swift
//  CollectionTraining
//
//  Created by Julien Genoud on 04/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class AvailableButton: UIView {

    var available = false {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = UIButton()
    var spacing = 5
    var stars = 5
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "assite")
        let emptyStarImage = UIImage(named: "assite1")
        let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            addSubview(button)
        
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)

        
        buttonFrame.origin.x = CGFloat(0 * (buttonSize + spacing))
        ratingButtons.frame = buttonFrame
        
        updateButtonSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        
        return CGSize(width: width, height: buttonSize)
    }
        
    
    func updateButtonSelectionStates() {
        
        
        if (available) {
            ratingButtons.selected = true;
        }
        
//        for (index, button) in ratingButtons.enumerate() {
//            // If the index of a button is less than the rating, that button should be selected.
//            button.selected = index < available
//        }
    }
}
