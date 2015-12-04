//
//  ViewController.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 23/11/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITabBarDelegate{

    var DataTable: [String] = ["xxx1", "xxx2", "xxx3","xxx4","xxx5","xxx6","xxx7","xxx8","xxx9","xxx10","xxx11","xxx12","xxx13","xxx14","xxx15","xxx16","xxx17","xxx18","xxx19","xxx20"]
    var ImageTable: [String] = ["Ingredient1.png","Ingredient2.jpg","Ingredient3.JPG","Ingredient4.jpg","Ingredient5.jpg","Ingredient6.jpg","Ingredient7.jpg","Ingredient8.jpg","Ingredient9.jpg","Ingredient10.jpg","Ingredient11.jpg","Ingredient12.jpg","Ingredient13.jpg","Ingredient14.jpg","Ingredient15.jpg","Ingredient16.jpg","Ingredient17.jpg","Ingredient18.jpg","Ingredient19.jpg","Ingredient20.jpg"]
    
    @IBOutlet weak var FridgeButton: UITabBarItem!
    @IBOutlet weak var NavigationTabBar: UITabBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemIndex = 0
        let bgColor = UIColor(red: 0.08, green: 0.726, blue: 0.702, alpha: 1.0)
        
        let itemWidth = NavigationTabBar.frame.width / CGFloat(NavigationTabBar.items!.count)
        let mutiply = itemWidth * CGFloat(itemIndex);
        let bgView = UIView(frame: CGRectMake(mutiply, 0, itemWidth, NavigationTabBar.frame.height))
        bgView.backgroundColor = bgColor
        NavigationTabBar.insertSubview(bgView, atIndex: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

/// TABBAR CONTROL
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if (item.tag == 0){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("FridgeView") as! UIViewController
            let nc  = UINavigationController(rootViewController: vc)
            self.presentViewController(nc, animated: false, completion: nil)
        }
        else if(item.tag == 1){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("MealView") as! UIViewController
            let nc  = UINavigationController(rootViewController: vc)
            self.presentViewController(nc, animated: false, completion: nil)
        }
        else if (item.tag == 2){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("ShopView") as! UIViewController
            let nc  = UINavigationController(rootViewController: vc)
            self.presentViewController(nc, animated: false, completion: nil)
        }
    }
/// TABABR CONTROL ///
/// COLECTION VIEW

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataTable.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: MyCustonCellCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! MyCustonCellCollectionViewCell
        cell.LabelCell.text = DataTable[indexPath.row]
        cell.ImageCell.image = UIImage(named: ImageTable[indexPath.row])
        return cell
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! UICollectionViewCell!
        print("dans LE PREMIER")
        if (cell.backgroundColor != UIColor.cyanColor()){
            cell.backgroundColor = UIColor.cyanColor()}
        else{
            cell.backgroundColor = UIColor.whiteColor()}
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! UICollectionViewCell!
        print("DANS LE SECOND")
    }
/// COLECTION VIEW ///
}

