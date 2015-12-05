//
//  MealViewController.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 03/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class MealTableViewController: UIViewController, UITabBarDelegate, UITableViewDelegate, UITableViewDataSource {
    /// INIT
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var NavigationTabBar: UITabBar!


    var recipes = [Recipe]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        print("DANS MEAL VIEW ==>\(OnTheFride)")


        let itemIndex = 1
        let bgColor = UIColor(red: 0.07, green: 0.4, blue: 0.9, alpha: 0.2)
        
        let itemWidth = NavigationTabBar.frame.width / CGFloat(NavigationTabBar.items!.count)
        let mutiply = itemWidth * CGFloat(itemIndex);
        let bgView = UIView(frame: CGRectMake(mutiply, 0, itemWidth, NavigationTabBar.frame.height))
        bgView.backgroundColor = bgColor
        
        NavigationTabBar.insertSubview(bgView, atIndex: 1)
    

        navigationItem.leftBarButtonItem = editButtonItem()
        
        // Load any saved meals, otherwise load sample data.
        if let savedMeals = loadMeals() {
            recipes += savedMeals
        } else {
            // Load the sample data.
            loadSampleMeals()
        }
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /// INIT ///
    /// TABBAR CONTROL
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if (item.tag == 0){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("FridgeView")
            let nc  = UINavigationController(rootViewController: vc)
            self.presentViewController(nc, animated: false, completion: nil)
        }
        else if(item.tag == 1){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("MealView") 
            let nc  = UINavigationController(rootViewController: vc)
            self.presentViewController(nc, animated: false, completion: nil)
        }
        else if (item.tag == 2){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("ShopView") 
            let nc  = UINavigationController(rootViewController: vc)
            self.presentViewController(nc, animated: false, completion: nil)
        }
    }
    
    func loadSampleMeals() {
        let photo1 = UIImage(named: "assite1")!
        let meal1 = Recipe(name: "Caprese Salad", photo: photo1, available: true)!
        
        meal1.addIngredient(Meal(name: "carrot")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)
        meal1.addIngredient(Meal(name: "Pattate")!)

        
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
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "RecipeTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RecipeTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let recipe = recipes[indexPath.row]
        
        cell.nameLabel.text = recipe.name
        cell.photoImageView.image = recipe.photo
//        cell.availableButton.available = recipe.available
        
        return cell
    }
    
    // Override to support conditional editing of the table view.
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            recipes.removeAtIndex(indexPath.row)
            saveMeals()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("show")
        
        if segue.identifier == "ShowDetail" {
            print("show detail")
            
            let mealDetailViewController = segue.destinationViewController as! MealViewController
            
            // Get the cell that generated this segue.
            if let selectedMealCell = sender as? RecipeTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedMeal = recipes[indexPath.row]
                mealDetailViewController.recipe = selectedMeal
            }
        }
        else if segue.identifier == "AddItem" {
            print("Adding new meal.")
        }
    }
    
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? MealViewController, meal = sourceViewController.recipe {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                recipes[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                // Add a new meal.
                let newIndexPath = NSIndexPath(forRow: recipes.count, inSection: 0)
                recipes.append(meal)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            saveMeals()
        }
    }

    
    

}
