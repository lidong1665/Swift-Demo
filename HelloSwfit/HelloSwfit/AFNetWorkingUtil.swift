//
//  AFNetWorkingUtil.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/17.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
/// 请求方法枚举
enum TKRequestMethod: String{
    case GET = "GET"
    case POST = "POST"
}

/**
 *基础URL
 */
let BASE_URL = "http://192.168.1.124:8080"

let _sessionManager = AFHTTPSessionManager()

/**
 *对AFNetworking的封装
 */
class AFNetWorkingUtil: NSObject {
    
    static func getBaseUrl(baseUrl:String) ->String{
    
        return BASE_URL
    }
    /**
     *post请求
     */
    static func post(action:String,params:Dictionary<String,String>){
    
        _sessionManager.POST(getBaseUrl(BASE_URL+action), parameters: params, success: { (operation:NSURLSessionDataTask?, responseObj:AnyObject?) in
                print(responseObj)
        }) { (operation:NSURLSessionDataTask? ,error:NSError) in
                print(error)
        }
    }
    /**
    *get请求
    */
    static func get(action:String,params:Dictionary<String,String>){
        _sessionManager.GET(getBaseUrl(BASE_URL+action), parameters: params, success: { (operation:NSURLSessionDataTask?, responseObj:AnyObject?) in
            print(responseObj)
        }) { (operation:NSURLSessionDataTask? ,error:NSError) in
            print(error)
        }
    
    }

}
