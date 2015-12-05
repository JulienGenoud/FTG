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
    var toDelete = [Int]()
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
/// CHANGER LA COULEUR EN ROUGE ET APRES QUAN DON REVCHANGE LE STATU ON APELLE LA FONCTION POUR SUPRIMER DANS LE
    @IBAction func EditPressed(sender: AnyObject) {
        if editStatu == false{
            EditButton.title = "Delet"
            editStatu = true}
        else{
            EditButton.title = "Edit"
            editStatu = false}
//        print("il faut suprimer les elements numero : \(toDelete)")
        toDelete = toDelete.sort()
        toDelete = toDelete.reverse()
          //  print("il faut suprimer les elements numero : \(toDelete)")
            var x = 0
        ///// CA MERDE JUSTE QUAND ON SELECTIONNE LE DERNIERE ELEMEN A SUPRIMER AVENT LA FIN
        while (toDelete.count > x){
        //    print("==========TAILLE DE MEALS LIST = \(meals.count)")
      //      print("==========TAILLE DE delet LIST = \(toDelete.count)")
    //        print("==========on suprime le truc a l'index \(toDelete[x])")
            meals.removeAtIndex(toDelete[x])
  //          print("-----------TAILLE DE MEALS LIST = \(meals.count)")
            x++
        }
        toDelete = []
        saveMeals()
//        print("+++++++++++TO DELETE A ETE CLEAN \(toDelete.count)")
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
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [Meal]
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        print("RETOUR PAR LE BOUTON SAVE")
        if let sourceViewController = sender.sourceViewController as? AddMeal, meal = sourceViewController.meal {
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                meals.append(meal)
            saveMeals()
        }
        CVCollection.reloadData()
    
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
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: MyCustonCellCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MyCustonCellCollectionViewCell
        let meal = meals[indexPath.row]

        cell.LabelCell.text = meal.name
        cell.ImageCell.image = meal.photo
        cell.backgroundColor = UIColor.whiteColor()
             return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! UICollectionViewCell!
    
        if (editStatu == false){
            print("SOMETHING on the case number:\(indexPath.row)")
            if (cell.backgroundColor != UIColor.cyanColor()){
                OnTheFride = OnTheFride + meals[indexPath.row].name + ";"
                cell.backgroundColor = UIColor.cyanColor()}
            else{
                cell.backgroundColor = UIColor.whiteColor()
                OnTheFride = OnTheFride.stringByReplacingOccurrencesOfString(meals[indexPath.row].name + ";", withString: "")}
        }
        else{
            print("XXXXXXXXXXXXXXXXXXXXX EDIT STATUT EST ENCORE TRUE")
            if (cell.backgroundColor == UIColor.redColor()){
                var x = 0
                while (toDelete[x] != indexPath.row){
                    x++;
                }
                print("il faut suprimer l'element a la position \(x) du tableau")
                toDelete.removeAtIndex(x)
                print("NOMBRE DE CHOSE A SUPRIMER : \(toDelete.count)")
                cell.backgroundColor = UIColor.whiteColor()}
            else{
                print("NOMBRE DE CHOSE A SUPRIMER : \(toDelete.count)")
                toDelete.insert(indexPath.row , atIndex: 0)
                print("nouvelle NOMBRE DE CHOSE A SUPRIMER : \(toDelete.count), un truc a ete ajouter a l'index : \(indexPath.row)")
                cell.backgroundColor = UIColor.redColor()}
        }
    }
/// COLECTION VIEW ///
    
}

