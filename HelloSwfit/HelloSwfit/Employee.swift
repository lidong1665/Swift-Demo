//
//  Employee.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/22.
//  Copyright © 2016年 lidong. All rights reserved.
//



class Employee: NSObject {

    var id:Int32!
    var name:String!
    var age:String!
    
    func toString() -> String {
        return "id = \(id) name = \(name) age = \(age)"
    }
}
