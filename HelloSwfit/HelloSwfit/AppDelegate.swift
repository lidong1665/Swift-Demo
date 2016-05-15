//
//  AppDelegate.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/8.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
//class 在swift 中是声明一个类，在IOS项目中AppDelegate原来oc中的AppDelegate,应用程序的入口对象

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /*
     var 声明变量关键字
     window 是变量名
     UIWindow 变量类型
     ? 可选类型在这里理解为空（nil）即可
     */
    //声明一个全局变量
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //背景颜色
        UINavigationBar.appearance().barTintColor = UIColor.greenColor()
        
        // 返回按钮文字的颜色
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        // 标题文字的颜色
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.blueColor()]
        

        
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

