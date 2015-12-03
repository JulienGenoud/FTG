//
//  ShopViewController.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 03/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITabBarDelegate {
    
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

}
