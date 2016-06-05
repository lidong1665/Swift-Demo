//
//  UIBUttonViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/21.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class UIBUttonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "按钮和标签"
        let btn1 = UIButton(type:UIButtonType.InfoDark)
        btn1.frame = CGRectMake(130, 80, 40, 40)
        
        let btn2 = UIButton(type:UIButtonType.RoundedRect)
        //设置按钮的位置和大小
        btn2.frame = CGRectMake(80, 130, 150, 44)
        //设置按钮的背景颜色
        btn2.backgroundColor = UIColor.purpleColor()
        //设置按钮的前景颜色
        btn2.tintColor = UIColor.yellowColor()
        //设置按钮的文字
        btn2.setTitle("Press ON", forState: .Normal)
        //设置按钮的点击事件
        btn2.addTarget(self, action: #selector(UIBUttonViewController.buttonTag(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        //为按钮设置标记
        btn2.tag = 20
        
        let btn3 = UIButton(type:UIButtonType.RoundedRect)
        btn3.backgroundColor = UIColor.brownColor()
        btn3.tintColor = UIColor.whiteColor()
        btn3.setTitle("Press Off", forState: .Normal)
        btn3.frame = CGRectMake(80, 180, 150, 44)
        btn3.layer.masksToBounds = true
        //设置按钮的圆角半径为10
        btn3.layer.cornerRadius = 5
        //设置按钮的边框宽度为4
        btn3.layer.borderWidth = 1
        //设置按钮的边框颜色
        btn3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        self.view.addSubview(btn1)
        self.view.addSubview(btn2)
        self.view.addSubview(btn3)
        
        //UILable 的学习
        let rect = CGRectMake(20, 280, 280, 80)
        
        let lable = UILabel(frame: rect)
        lable.text = "Hello Lable"
        
        let font = UIFont(name: "宋体",size: 12)
        lable.font = font
        //设置文字的阴影颜色
        lable.shadowColor = UIColor.lightGrayColor()
        //设置标签文字的阴影在横向和纵向的偏移距离
        lable.shadowOffset = CGSizeMake(2,2)
        //设置文字的对其的方式
        lable.textAlignment = NSTextAlignment.Center
        //设置标签文字的颜色
        lable.textColor = UIColor.purpleColor()//紫色
        //设置标签的背景颜色为黄色
        lable.backgroundColor = UIColor.yellowColor()
        
        
        self.view.addSubview(lable)
             }
    
    /**
     按钮的事件处理
     
     - parameter btn: <#btn description#>
     */
    
    func buttonTag(btn:UIButton) {
        /**
         <#Description#>
         
         - parameter withTitle: <#withTitle description#>
         */
//        ProgressHUD.sharedInstance.showDefaultLoadingAlertOnView(self.view, withTitle: "Loading")
//        
//        ProgressHUD.sharedInstance.showDefaultErrorAlertOnView(self.view, withTitle: "登录失败")
//        
//        
//        ProgressHUD.sharedInstance.showDefaultDoneAlertOnView(self.view, withTitle: "登录成功")
        
//        
//        let alter = UIAlertController(title: "Information",message: "Button Event",preferredStyle: UIAlertControllerStyle.Alert)
//        
//        let oKAction = UIAlertAction(title: "OK",style: UIAlertActionStyle.Default,handler: nil)
//        alter.addAction(oKAction)
//        
//        self.presentViewController(alter, animated: true, completion: nil)
        
        
     MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        let popTime = dispatch_time(DISPATCH_TIME_NOW,
                                        Int64(20.0 * Double(NSEC_PER_SEC)))
        dispatch_after(popTime,dispatch_get_main_queue()) {
            
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            
        }
    }
    
    
    

//    dispatch_after(popTime, GlobalMainQueue) { // 2
//    let count = PhotoManager.sharedManager.photos.count
//    if count > 0 {
//    self.navigationItem.prompt = nil
//    } else {
//    self.navigationItem.prompt = "Add photos with faces to Googlyify them!"
//    }
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
