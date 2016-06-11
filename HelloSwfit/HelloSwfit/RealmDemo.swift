//
//  RealmDemo.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/11.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
import RealmSwift
class RealmDemo:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
       let h =  HandleData()
//        let dog = Dog()
//        dog.age = 2
//        dog.name = "gggg"
//        h.addDog(dog)
//        let dogs1 = List<Dog>()
//        dogs1.append(dog)
//        
//        let person = Person()
//        person.name = "lidong"
//        person.dogs = dogs1
//        
//        h.addPerson(person)
        
      let result =   h.findAll()
        print(result)
    }
    
}
