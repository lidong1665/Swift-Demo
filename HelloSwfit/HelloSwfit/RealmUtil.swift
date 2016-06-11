//
//  RealmUtil.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/11.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation
import RealmSwift
/// RealmUtil工具类
class RealmUtil {

    
    private static let instance = RealmUtil()
    // 单例  全局的数据访问接口
    class var sharedInstance: RealmUtil
    {
        
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : RealmUtil? = nil
            
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = RealmUtil()
        }
        return Static.instance!
    }
    
    
    /**
     得到Realm
     
     - returns: <#return value description#>
     */
    func getRealm() -> Realm{
        
        var config = Realm.Configuration()
        
        // Use the default directory, but replace the filename with the username
        config.fileURL = config.fileURL!.URLByDeletingLastPathComponent?
            .URLByAppendingPathComponent("realm_demo.realm")
       
        // 创建一个有配置的realm
        let realm = try! Realm(configuration: config)
        
        return realm
    
    }
    
    
}