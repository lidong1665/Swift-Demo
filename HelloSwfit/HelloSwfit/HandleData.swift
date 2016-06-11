//
//  HandleData.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/11.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation
import RealmSwift
/// 处理数据
class HandleData {
    
    /**
     添加一个狗
     
     - parameter dog: <#dog description#>
     */
    func addDog(dog:Dog){
        let  realm = RealmUtil.sharedInstance.getRealm()
        
        try! realm.write {
            realm.add(dog)
        }
    }
    
    
    /**
     修改一个狗的信息
     - parameter dog: <#dog description#>
     */
    func updateDog(dog:Dog){
        let  realm = RealmUtil.sharedInstance.getRealm()
        try! realm.write {
            realm.add(dog,update:true)
        }
    }
    
    
    
    /**
     删除一个狗的信息
     - parameter dog: <#dog description#>
     */
    func deleteDog(dog:Dog){
        let  realm = RealmUtil.sharedInstance.getRealm()
        try! realm.write {
            realm.delete(dog)
        }
    }
    /**
     查询所有狗的信息
     
     - returns: <#return value description#>
     */
    func findAll(code:String)  -> RealmSwift.Results<Dog> {
        
    let  realm = RealmUtil.sharedInstance.getRealm()
        
    let results = realm.objects(Dog.self).filter("age = \(code)")

    return  results
    }
    
    
    /**
     添加一个人
     
     - parameter p:
     */
    func addPerson(p:Person){
        let  realm = RealmUtil.sharedInstance.getRealm()
        
        try! realm.write {
            realm.add(p)
        }
    }
    
    /**
     查找所有的用户信息
     
     - returns: <#return value description#>
     */
    func findAll() ->   RealmSwift.Results<Person>{
        
        
        let  realm = RealmUtil.sharedInstance.getRealm()
        
        let results = realm.objects(Person.self)
        
        return  results
        
        
    }
    

}
