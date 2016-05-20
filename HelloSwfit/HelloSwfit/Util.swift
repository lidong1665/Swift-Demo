//
//  Util.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/15.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
/**
 *
 *常用工具类
 */
class Util {
    
      /**
         *
         *页面跳转
         *
         */
     static   func log(desc:String,message:String){
        print("\(desc) = \(message)")
     }
    
    static   func log(desc:String,message:Int){
        print("\(desc) = \(message)")
    }
    
    /**
    *
    */
    static func openNewViewController(dec:String,vc:UIViewController){
        
        let myStoryBoard = vc.storyboard
        let anotherView:UIViewController = (myStoryBoard?.instantiateViewControllerWithIdentifier(dec))!
        vc.presentViewController(anotherView, animated: true, completion: nil)
    }

}
