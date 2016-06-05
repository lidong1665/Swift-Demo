//
//  NetWokingModel.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/5.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 *  定义获取数据的代理
 */
protocol ZGJMModelDelegate {
    
    /**
     获取数据成功的回调
     
     - parameter error: <#error description#>
     */
    func getDataError(error:String)
    /**
     获取数据失败的回调
     
     - parameter items: <#items description#>
     */
    func getDataSuccess(items:Array<String>)
}


/// model层用来获取数据
class ZGJMModel:ResponseResultDelegate {
    
    
    var delegate : ZGJMModelDelegate!

    
    init(delegate : ZGJMModelDelegate){
        self.delegate = delegate
    }
    /**
     获取周公解梦的数据
     */
    func getZGJMData() {
        let aFUtil:AFNetWorkingUtil  = AFNetWorkingUtil.sharedInstance
        aFUtil.delegate = self
        let action:String = "/dream/category"
        let  dic = ["key":"c73b082b0c150b3bcba2cea1b96a8922"]
        aFUtil.get(action, params: dic)
    }
    
    
    /**
     <#Description#>
     
     - parameter responseObj: <#responseObj description#>
     */
    func responseSuccess(responseObj: AnyObject?) {
        var items:Array = [String]()
        let json = JSON(responseObj!)
        
        Util.log("responseSuccess", message: json["error_code"].intValue)
        Util.log("responseSuccess", message: json["reason"].string!)
        Util.log("responseSuccess", message: json["result"].array!.count)
        
        let d =  json["result"].array!.count
        if d > 0  {
            let list: Array<JSON> =  json["result"].array!
            
            for item in list {
                items.append(item["name"].string!)
            }
        }
        
        delegate.getDataSuccess(items)
    }
    /**
     <#Description#>
     
     - parameter responseObj: <#responseObj description#>
     */
    func responseError(responseObj: AnyObject?) {
        delegate.getDataError("服务器异常！")
    }
    
    
}
