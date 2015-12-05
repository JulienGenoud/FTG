//
//  IngrendientAddView.swift
//  CollectionTraining
//
//  Created by Julien Genoud on 05/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class IngrendientAddView: UITableViewController {
    
    var meals = [Meal]()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
//    navigationItem.leftBarButtonItem = editButtonItem()
        
        
        if let savedMeals = loadMeals() {
            print("Init View: Il y a des ingredients a load")
            meals += savedMeals
            print("Nb: \(meals.count)")
        } else {
            print("Init View: Nothing to load")
            // Load the sample data.
            //  loadSampleMeals()
        }
    
    }
    
    func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [Meal]
    }
    //
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "IngredientAddTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! IngredientAddTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        
        
        if let index = selected.indexOf(meal.name) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        if cell.selected
        {
            cell.selected = false
            if cell.accessoryType == UITableViewCellAccessoryType.None
            {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
            else
            {
                cell.accessoryType = UITableViewCellAccessoryType.None
            }
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        let meal = meals[indexPath.row]

        if cell!.selected
        {
            cell!.selected = false
            if cell!.accessoryType == UITableViewCellAccessoryType.None
            {
                if selected.indexOf(meal.name) == nil {
                    selected.append(meal.name)
                }
                cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
            else
            {
                
                if let index = selected.indexOf(meal.name) {
                    selected.removeAtIndex(index)
                }
                cell!.accessoryType = UITableViewCellAccessoryType.None
            }
        }
    }
    
    override func willMoveToParentViewController(parent: UIViewController?) {
        print("save current ingredients")
        if parent == nil {
            // Back btn Event handler
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("save segue")
    }
    
//
//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
    
    
//    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            meals.removeAtIndex(indexPath.row)
//            saveMeals()
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }


}
