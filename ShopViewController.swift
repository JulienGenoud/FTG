//
//  ShopViewController.swift
//  CollectionTraining
//
//  Created by anthony lethuillier on 03/12/15.
//  Copyright © 2015 anthony lethuillier. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var NavigationTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let itemIndex = 2
        let bgColor = UIColor(red: 0.07, green: 0.4, blue: 0.9, alpha: 0.2)
        
        let itemWidth = NavigationTabBar.frame.width / CGFloat(NavigationTabBar.items!.count)
        let mutiply = itemWidth * CGFloat(itemIndex);
        let bgView = UIView(frame: CGRectMake(mutiply, 0, itemWidth, NavigationTabBar.frame.height))
        bgView.backgroundColor = bgColor
        
        
        NavigationTabBar.insertSubview(bgView, atIndex: 2)
    }

    
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
