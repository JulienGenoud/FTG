//
//  ShopViewController.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 03/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITabBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
  //  var DataTable: [String] = ["xxx1", "xxx2", "xxx3","xxx4"]//,"xxx5","xxx6","xxx7","xxx8","xxx9","xxx10","xxx11","xxx12","xxx13","xxx14","xxx15","xxx16","xxx17","xxx18","xxx19","xxx20"]
    
    @IBOutlet weak var NavigationTabBar: UITabBar!
    @IBOutlet weak var TheTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemIndex = 2
        let bgColor = UIColor(red: 0.07, green: 0.4, blue: 0.9, alpha: 0.2)
        
        let itemWidth = NavigationTabBar.frame.width / CGFloat(NavigationTabBar.items!.count)
        let mutiply = itemWidth * CGFloat(itemIndex);
        let bgView = UIView(frame: CGRectMake(mutiply, 0, itemWidth, NavigationTabBar.frame.height))
        bgView.backgroundColor = bgColor
        //TheTableView.delegate = self
        
        NavigationTabBar.insertSubview(bgView, atIndex: 2)
    }

    /// TABLE VIEW
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     //   print("DANS NUMBEROFSECTIONINTABLEVIEW")
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print("\(DataTable.count)")
        return DataTable.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath)
        cell.textLabel!.text = DataTable[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            DataTable.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /// TABLE VIEW ///
    
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

}
