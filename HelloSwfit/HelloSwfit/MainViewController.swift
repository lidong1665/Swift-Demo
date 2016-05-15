//
//  MainViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/14.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class MainViewController : UITabBarController{
    
    @IBOutlet weak var tab_bar: UITabBar!
   
    @IBOutlet weak var nv_item: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nv_item.title = "UI"
        
     }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
         print("当前是视图名称 =  \((tab_bar.selectedItem?.title!)! as String)")
         self.nv_item.title = tab_bar.selectedItem?.title
    }
    
    
}