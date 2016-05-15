//
//  ResponseData.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/11.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class ResponseData {

    var error_code:Int = 0
    var reason:String = ""
    var result :Array<DreamModel> = Array<DreamModel>()
    
    
    init(error:Int,reason:String,result:Array<DreamModel>){
    self.error_code = error
    self.reason = reason
    self.result = result
    }
    
    func toString(){
       print("error=\(error_code)  reason = \(reason)  result:\(result)")
    }
}
