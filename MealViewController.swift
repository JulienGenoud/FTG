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
            selected = recipe.ingredients
            
            if recipe.ingredients.count == 0 {
               IngredientText.text = "no ingredients"
            }
            print(OnTheFride)
            print(OnTheFride.rangeOfString("efwe"))

            for ingredients in recipe.ingredients {
                if OnTheFride.rangeOfString(ingredients) != nil{
                    IngredientText.text.appendContentsOf("- " + ingredients + " not availaible \n")
                    print("exists")
                }
                else {
                    IngredientText.text.appendContentsOf("- " + ingredients + "\n")
                    print("exists")
                }
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
    
    override func viewWillAppear(animated: Bool) {
        print(selected)
        IngredientText.text = "Please add ingredients"
        if selected.count != 0 {
            IngredientText.text = ""
            for ingredients in selected {
                if OnTheFride.rangeOfString(ingredients) != nil{
                    IngredientText.text.appendContentsOf("- " + ingredients + "\n")
                }
                else {
                    IngredientText.text.appendContentsOf("- " + ingredients + "\n")
                }
                //recipe!.addIngredient(Meal(name: ingredients)!)
            }
        }
        
    }
    
    
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        selected = [];
    }
}

