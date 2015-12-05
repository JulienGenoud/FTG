//
//  AddMeal.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 04/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import Foundation
import UIKit

class AddMeal: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var TFName: UITextField!
    @IBOutlet weak var IVPhoto: UIImageView!
    @IBOutlet weak var SaveButton: UIBarButtonItem!
    var meal: Meal?
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
    }
    
    /// INIT
    override func viewDidLoad() {
        super.viewDidLoad()
        checkValidMealName()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        checkValidMealName()
        textField.resignFirstResponder()
        return true;
    }
    /// INIT ///

    
    ///
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if SaveButton === sender {
            let name = TFName.text ?? ""
            let photo = IVPhoto.image
            meal = Meal(name: name, photo: photo)
        print("UN MEAL A ETE DEFINI")
        }
    }

    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = TFName.text ?? ""
        SaveButton.enabled = !text.isEmpty
    }
    //////
    
    /// IMAGEPICKER
    @IBAction func ChooseImage(sender: AnyObject) {
        print("IMAGE TAP")
        TFName.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        IVPhoto.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    /// IMAGEPICKER ///

        func dismissKeyboard() {
        view.endEditing(true)
    }

}