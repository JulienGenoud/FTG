//
//  ViewController.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 23/11/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITabBarDelegate{

    var meals = [Meal]()
    @IBOutlet weak var FridgeButton: UITabBarItem!
    @IBOutlet weak var NavigationTabBar: UITabBar!
    @IBOutlet weak var CVCollection: UICollectionView!
    var editStatu = false as Bool
    var OnTheFride = ""
    @IBOutlet weak var EditButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemIndex = 0
        let bgColor = UIColor(red: 0.07, green: 0.4, blue: 0.9, alpha: 0.2)
        let itemWidth = NavigationTabBar.frame.width / CGFloat(NavigationTabBar.items!.count)
        let mutiply = itemWidth * CGFloat(itemIndex);
        let bgView = UIView(frame: CGRectMake(mutiply, 0, itemWidth, NavigationTabBar.frame.height))
        bgView.backgroundColor = bgColor
        
        NavigationTabBar.insertSubview(bgView, atIndex: 0)
        
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

    @IBAction func EditPressed(sender: AnyObject) {
        if editStatu == false{
            EditButton.title = "End"
            editStatu = true}
        else{
            EditButton.title = "Edit"
            editStatu = false}
        print("\(editStatu)")
        CVCollection.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

/// EDIT & ERASE
    @IBAction func EraseButton(sender: AnyObject) {
    print("DANS LE VIEW CONTROLLER SOMETHING TO ERASE")
        
        //        somethingBeDeleted = true
//        CVCollection.reloadData()
    }
    @IBAction func EditButton(sender: AnyObject) {
    print("DANS LE VIEW CONTROLLER SMOMETHING TO EDIT")
    }
    
/// EDIT & ERASE ///
    
/// MEAL DATA
    func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    
    func loadMeals() -> [Meal]? {
//        var m: Meal
//        m = NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? Meal
//        print("Nombre d'objet dans la table ====> \(m.count)")
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [Meal]
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
//        CVCollection.reloadData();
        print("RETOUR PAR LE BOUTON SAVE")
        if let sourceViewController = sender.sourceViewController as? AddMeal, meal = sourceViewController.meal {
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                // Update an existing meal.
//                meals[selectedIndexPath.row] = meal
//            }
//            else {
                // Add a new meal.
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                meals.append(meal)
//            }
            // Save the meals.
            saveMeals()
        }
        CVCollection.reloadData()
       // viewDidLoad()
    }
    
/// MEAL DATA ///
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
/// TABABR CONTROL ///
/// COLECTION VIEW

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(" TAILLE DE LA COLLECTION : \(meals.count)")
        return meals.count
    }
    
    func updateCollectionView(){
//        print("LA TABLE A BIEN ETE MIS A JOUR ET IL Y A EFFECTIVEMENT UN TRUC A DELETE ")
//        somethingBeDeleted = false
//        var i = 0
//        while (i < meals.count){
//            let meal = meals[i]
//            if ()
//
//            i++;
//        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: MyCustonCellCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MyCustonCellCollectionViewCell
        let meal = meals[indexPath.row]

        
//        if (cell.beDelet == true){
//            somethingBeDeleted = true;
            //            print("IL Y A UN TRUC A SUPRIMER LA !")
//            // return cell
//    print("SIZE DE LA TABLE MEALS: \(meals.count)")
//            meals.removeAtIndex(indexPath.row - 1)
////            print("La cellule numero :\(indexPath.row - 1)")
//            saveMeals()
//            print("SIZE DE LA TABLE MEALS: \(meals.count)")
//
////            print("qui comptien : \(meal.name)")
//  //          CVCollection.reloadData()
//        }

        
        
        cell.LabelCell.text = meal.name
        cell.ImageCell.image = meal.photo
        if (editStatu == true){
            cell.EditButton.hidden = false
            cell.EraseButton.hidden = false
        }
        else{
            cell.EditButton.hidden = true
            cell.EraseButton.hidden = true
        }
             return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! UICollectionViewCell!
        print("SOMETHING on the case number:\(indexPath.row)")
        if (cell.backgroundColor != UIColor.cyanColor()){
            OnTheFride = OnTheFride + meals[indexPath.row].name + ";"
            cell.backgroundColor = UIColor.cyanColor()}
        else{
            cell.backgroundColor = UIColor.whiteColor()}
        print("=====================================")
        print(OnTheFride)
        print("=====================================")
    }
    
//    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
//        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! UICollectionViewCell!
//        print("DANS LE SECOND")
//    }
    
/// COLECTION VIEW ///
}

