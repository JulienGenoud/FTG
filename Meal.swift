//
//  Meal.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 04/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import Foundation
import UIKit

class Meal: NSObject, NSCoding {
    // MARK: Properties
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        // Must call designated initializer.
        self.init(name: name, photo: photo)
    }
    
    var name: String
    var photo: UIImage?

    
    init?(name: String, photo: UIImage?) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
    }
}
