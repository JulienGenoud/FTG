//
//  RecipeTableView.swift
//  CollectionTraining
//
//  Created by Julien Genoud on 04/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class RecipeViewController: UITableViewController {
    
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // Load any saved meals, otherwise load sample data.
        if let savedMeals = loadMeals() {
            recipes += savedMeals
        } else {
            // Load the sample data.
            loadSampleMeals()
        }
        

    }
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "assite1")!
        let meal1 = Recipe(name: "Caprese Salad", photo: photo1, available: true)!
        
        let photo2 = UIImage(named: "assite1")!
        let meal2 = Recipe(name: "Chicken and Potatoes", photo: photo2, available: false)!
        
        let photo3 = UIImage(named: "assite1")!
        let meal3 = Recipe(name: "Pasta with Meatballs", photo: photo3, available: false)!
        
        recipes += [meal1, meal2, meal3]
    }
    
    
    func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(recipes, toFile: Recipe.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    
    func loadMeals() -> [Recipe]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Recipe.ArchiveURL.path!) as? [Recipe]
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RecipeTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let recipe = recipes[indexPath.row]
        
        cell.nameLabel.text = recipe.name
        cell.photoImageView.image = recipe.photo
        cell.availableButton.available = recipe.available
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            recipes.removeAtIndex(indexPath.row)
            saveMeals()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
    
    // Configure the cell...
    
    return cell
    }
    */
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        print("show")
//        
//        if segue.identifier == "ShowDetail" {
//            print("show detail")
//            
//            let mealDetailViewController = segue.destinationViewController as! RecipeTableViewCell
//            
//            // Get the cell that generated this segue.
//            if let selectedMealCell = sender as? RecipeTableViewCell {
//                let indexPath = tableView.indexPathForCell(selectedMealCell)!
//                let selectedMeal = meals[indexPath.row]
//                mealDetailViewController.meal = selectedMeal
//            }
//        }
//        else if segue.identifier == "AddItem" {
//            print("Adding new meal.")
//        }
//    }
//    
//    
//    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
//        if let sourceViewController = sender.sourceViewController as? AvailableButton, meal = sourceViewController.meal {
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                // Update an existing meal.
//                meals[selectedIndexPath.row] = meal
//                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
//            } else {
//                // Add a new meal.
//                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
//                meals.append(meal)
//                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
//            }
//            saveMeals()
//        }
//    }
    
}
