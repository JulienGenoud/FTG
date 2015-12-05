//
//  MealViewController.swift
//  CollectionTraining
//
//  Created by Julien Genoud on 05/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

var selected = [String]()

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var mealNameLabel: UINavigationItem!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    @IBOutlet weak var EditIngredients: UIButton!
    @IBOutlet weak var IngredientText: UITextView!
//    @IBOutlet weak var ratingControl: RatingControl!
    
    
    var recipe: Recipe?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        print("test")
        print(selected)

        selected.removeAll()
      
        if let recipe = recipe {
            navigationItem.title = recipe.name
            nameTextField.text   = recipe.name
            
            if recipe.ingredients.count == 0 {
               IngredientText.text = "no ingredients"
            }
            for ingredients in recipe.ingredients {
                IngredientText.text.appendContentsOf("- " + ingredients + "\n")
            }
            
            IngredientText.sizeToFit()

            
//            photoImageView.image = recipe.photo
//            ratingControl.rating = meal.rating
        } else {
            IngredientText.text = "no ingredients"
        }
        
        checkValidMealName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        SaveButton.enabled = false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if SaveButton === sender {
            let name = nameTextField.text ?? ""
//            let photo = photoImageView.image
//            let rating = ratingControl.rating
            
            recipe = Recipe(name: name, available: true, ingredients: selected)
            
        }
    }
    
    func checkValidMealName() {
        let text = nameTextField.text ?? ""
        SaveButton.enabled = !text.isEmpty
    }
    
  
    @IBAction func Tap(sender: UITapGestureRecognizer) {
        print("test")

    }
    
    override func viewWillAppear(animated: Bool) {
        if selected.count != 0 {
            IngredientText.text = ""
            for ingredients in selected {
                IngredientText.text.appendContentsOf("- " + ingredients + "\n")
                //recipe!.addIngredient(Meal(name: ingredients)!)
            }
        }
        
    }
}

