//
//  Recipe.swift
//  CollectionTraining
//
//  Created by Julien Genoud on 04/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class Recipe : NSObject, NSCoding {
    var name: String
    var photo: UIImage?
    var ingredients: [String]
    var available: Bool
    
    init?(name: String, photo: UIImage?, available: Bool) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.available = available
        self.ingredients = []
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
    }
    
    init?(name: String, available: Bool) {
        // Initialize stored properties.
        self.name = name
        self.available = available
        self.ingredients = []
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
    }
    
    init?(name: String, available: Bool, ingredients: [String]) {
        // Initialize stored properties.
        self.name = name
        self.available = available
        self.ingredients = ingredients
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
    }
    
   
    
//    func addIngredient(ingredient: Meal) {
//        self.ingredients.append(ingredient);
//    }
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ingredientsKey = "ingredients"
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeObject(ingredients, forKey: PropertyKey.ingredientsKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
//        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let ingredients = aDecoder.decodeObjectForKey(PropertyKey.ingredientsKey) as! [String]
        
        let available = false
        // Must call designated initializer.
        self.init(name: name, available: available, ingredients: ingredients)
    }
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("recipes")
    
    
}