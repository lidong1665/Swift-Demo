//
//  AFNetWokingBlockUtil.swift
//  HelloSwfit
//
//  Created by lidong on 16/7/7.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation
/// 对AFNetworking的封装

/**
 响应成功的回调
 
 - parameter response: 成功的信息
 */

typealias responseSuccessBlock = (success:AnyObject?)  -> Void

/**
 响应失败的回调
 
 - parameter responseError: 失败的信息
 */

typealias responseErrorBlock = (error:AnyObject?) -> Void


class AFNetWorkingBlockUtil {
    
    
    /// 基础URL
    let BASE_URL = "http://v.juhe.cn"
    /// AFHTTPSessionManager
    let _sessionManager = AFHTTPSessionManager()
    
    // 单例  全局的的网络工具
    class var sharedInstance: AFNetWorkingBlockUtil
    {
        
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : AFNetWorkingBlockUtil? = nil
            
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = AFNetWorkingBlockUtil()
        }
        return Static.instance!
    }
    
    
    /**
     获取baseUrl
     
     - parameter baseUrl: 基础的url
     
     - returns: URL
     */
    func getBaseUrl() ->String{
        
        return BASE_URL
    }
    
    
    
    /**
     get请求
     
     - parameter action: 请求的action
     - parameter params: 请求参数
     */
    func get(action:String,params:Dictionary<String,String>,succblock:responseSuccessBlock,erroeblock:responseErrorBlock){
        _sessionManager.GET(getBaseUrl()+action, parameters: params, success: { (operation:NSURLSessionDataTask?, responseObj:AnyObject?) in
            print("响应成功\(responseObj)")
            succblock(success:responseObj)
        }) { (operation:NSURLSessionDataTask? ,error:NSError) in
            print()
            print("响应失败\(error)")
            erroeblock(error:error)
        }
        
    }
    
    
    
}