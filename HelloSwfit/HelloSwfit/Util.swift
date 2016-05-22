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
     static   func log(desc:String,message:String){
        print("\(desc) = \(message)")
     }
    /**
     打印log
     
     - parameter desc:    <#desc description#>
     - parameter message: <#message description#>
     */
    static   func log(desc:String,message:Int){
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

}
