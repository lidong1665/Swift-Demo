//
//  ButtonCreator.swift
//  HelloSwfit
//
//  Created by lidong on 16/7/7.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation
class ButtonCreation: NSObject {
    
    func createButton() {
        let button = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(20.0, 20.0, 90.0, 35.0)
        button.setTitle("Tap Me", forState: UIControlState.Normal)
        button.addTarget(self, action: #selector(ButtonCreation.buttonTouched(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func buttonTouched(sender: AnyObject) {
        print("Button touched!")
    }
}