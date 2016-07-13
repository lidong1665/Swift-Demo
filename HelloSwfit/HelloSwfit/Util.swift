//
//  Util.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/15.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
import Toast_Swift

/// 常用工具类
class Util {
    
    /**
     打印Log
     
     - parameter desc:    <#desc description#>
     - parameter message: <#message description#>
     */
     static   func log_s(desc:String,message:String){
        print("\(desc) = \(message)")
     }
    /**
     打印log
     
     - parameter desc:    <#desc description#>
     - parameter message: <#message description#>
     */
    static   func log_i(desc:String,message:Int){
        print("\(desc) = \(message)")
    }
    
    /**
     打开新的页面
     
     - parameter dec: <#dec description#>
     - parameter vc:  <#vc description#>
     */
    static func openNewViewController(dec:String,vc:UIViewController){
        
        let myStoryBoard = vc.storyboard
        let anotherView:UIViewController = (myStoryBoard?.instantiateViewControllerWithIdentifier(dec))!
        vc.presentViewController(anotherView, animated: true, completion: nil)
    }
    /**
     显示Toast
     
     - parameter vc:      <#vc description#>
     - parameter message: <#message description#>
     */
    static func showToast(vc:UIViewController,message:String){
        vc.view.makeToast(message)
    }

    /**
     获取DocumnetPath
     
     - returns: <#return value description#>
     */
    
   static func getDocumnetPath() -> String {
        let documentPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
             NSSearchPathDomainMask.UserDomainMask, true)
        let documnetPath = documentPaths[0]
        print("documnetPath= \(documnetPath)")
        return  documnetPath
    }
    /**
     模态跳转界面
     - parameter senderViewController: 目标的ViewController
     - parameter title:                标题
     - parameter nowViewController:    当前ViewController
     */
    func presentNavController(senderViewController:UIViewController, title:String,nowViewController:UIViewController)  {
    
       let nav:UINavigationController = handleNav(senderViewController,title:title)
    
        nowViewController.tabBarController?.presentViewController(nav, animated: true, completion:nil)
        
    }
    

    /**
      模态跳转界面（使用storyboard）
     
     - parameter dec:               storyboard标识符
     - parameter title:             标题
     - parameter nowViewController: 当前的nowViewController
     */
     func presentNavController_s(dec:String, title:String,nowViewController:UIViewController)  {
        
        let myStoryBoard = nowViewController.storyboard
        let senderViewController:UIViewController = (myStoryBoard?.instantiateViewControllerWithIdentifier(dec))!
        let nav:UINavigationController = handleNav(senderViewController, title: title)
        nowViewController.tabBarController?.presentViewController(nav, animated: true, completion:nil)
        
    }
    
    /**
     <#Description#>
     
     - parameter senderViewController: 目标的ViewController
     - parameter title:                标题
     
     - returns:  UINavigationController 导航控制器
     */
     func handleNav(senderViewController:UIViewController,title:String) -> UINavigationController {
        
        let nav:UINavigationController = UINavigationController.init(rootViewController: senderViewController)
        //背景颜色
        nav.navigationBar.barTintColor = UIColor.greenColor()
        
        // 返回按钮文字的颜色
        nav.navigationBar.tintColor = UIColor.whiteColor()
        
        // 标题文字的颜色
        nav.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blueColor()]
        
        senderViewController.navigationItem.titleView = buildView(title)
        
        
        
        return nav
    }

    
    
    /**
     包装一个View
     
     - parameter title: <#title description#>
     
     - returns: <#return value description#>
     */
     func buildView(title:String) -> UIView {
        let lbTitleText = UILabel()
        lbTitleText.text = title
        lbTitleText.textAlignment = NSTextAlignment.Center
        lbTitleText.textColor = UIColor.whiteColor()
        lbTitleText.font = UIFont.systemFontOfSize(13)
        var size = CGRect()
        let size2 = CGSize()
        //Swift计算字符串高度,宽度,size方法
        size = title.boundingRectWithSize(size2, options: NSStringDrawingOptions.UsesFontLeading, attributes: nil, context: nil);
        lbTitleText.frame = CGRectMake(0, 0, size.width, size.height)
        
        let view:UIView = UIView()
        view.frame = lbTitleText.frame
        view.addSubview(lbTitleText)
        return view
    }
    
    /**
     创建leftView
     - returns: <#return value description#>
     */
   static func leftView() -> UIButton {
        
        let leftButton:UIButton = UIButton(type:UIButtonType.Custom)
        leftButton.frame = CGRectMake(0, 0, 28, 20)
        leftButton.setBackgroundImage(UIImage(named:"btn_back_bg.png"), forState: .Normal)
        leftButton.showsTouchWhenHighlighted = true
        
    return leftButton
    }
    
}



