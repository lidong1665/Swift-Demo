//
//  BaseViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/7/7.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation

/// 基本的ViewController

class BaseViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftB = Util.leftView()
        leftB.addTarget(self, action:#selector(BaseViewController.OnClickBtnBack(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        let leftItem:UIBarButtonItem = UIBarButtonItem.init(customView: leftB)
        //添加左边的返回按钮
        self.navigationItem.leftBarButtonItem  = leftItem
        
    }
    
    
    /**
     *按钮的事件处理
     */
    func OnClickBtnBack(btn_sunbmit: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}