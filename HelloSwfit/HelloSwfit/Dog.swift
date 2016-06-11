//
//  Dog.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/11.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

import RealmSwift

class Dog: Object {
    dynamic var name = ""
    dynamic var age = 0
}

class Person: Object {
    dynamic var name = ""
    dynamic var picture: NSData? = nil // optionals supported
    var dogs = List<Dog>()
}