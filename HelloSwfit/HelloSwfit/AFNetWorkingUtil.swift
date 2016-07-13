//
//  AFNetWorkingUtil.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/17.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit


/// 对AFNetworking的封装

class AFNetWorkingUtil {
    
    
    /// 基础URL
    let BASE_URL = "http://v.juhe.cn"
    /// AFHTTPSessionManager
    let _sessionManager = AFHTTPSessionManager()
    
         /// 定义一个响应结果的传递代理
    var  delegate: ResponseResultDelegate?
    
    // 单例  全局的的网络工具
    class var sharedInstance: AFNetWorkingUtil
    {
        
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : AFNetWorkingUtil? = nil
            
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = AFNetWorkingUtil()
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
     post请求
     
     - parameter action: 请求的action
     - parameter params: 请求参数
     - parameter v:      <#v description#>
     */
    func post(action:String,params:Dictionary<String,String>){
        
        _sessionManager.POST(getBaseUrl()+action, parameters: params, success: { (operation:NSURLSessionDataTask?,
            responseObj:AnyObject?) in
                print(responseObj)
            self.delegate?.responseSuccess(responseObj)
        }) { (operation:NSURLSessionDataTask? ,error:NSError) in
                print(error)
            self.delegate?.responseError(error)
            
        }
    }
    /**
     get请求
     
     - parameter action: 请求的action
     - parameter params: 请求参数
     */
     func get(action:String,params:Dictionary<String,String>){
        _sessionManager.GET(getBaseUrl()+action, parameters: params, success: { (operation:NSURLSessionDataTask?, responseObj:AnyObject?) in
            print(responseObj)
            self.delegate?.responseSuccess(responseObj)
        }) { (operation:NSURLSessionDataTask? ,error:NSError) in
            print(error)
            self.delegate?.responseError(error)
        }
    
    }
    

    /**
     上传单张图片
     
     - parameter action:   请求的action
     - parameter params:   参数
     - parameter fileData: 文件
     - parameter fileName: 文件名称
     */
    func uploadFile(action:String,params:Dictionary<String,String>
        ,fileData:NSData,fileName:String) {
        
        _sessionManager.POST(action, parameters:
            
            params, constructingBodyWithBlock: { (formdata:AFMultipartFormData?) in
            //在这里构造图片
                formdata!.appendPartWithFileData(fileData, name:"file", fileName:fileName, mimeType:"image/jpg")
                
            }, success: { (operation:NSURLSessionDataTask?, responseObj:AnyObject?) in
                print(responseObj)
                self.delegate?.responseSuccess(responseObj)
                
        }) { (operation:NSURLSessionDataTask?,error:NSError?) in
                print(error)
            self.delegate?.responseError(error)
        }
    }


    
    /**
     上传多张图片
     
     - parameter action:   请求的action
     - parameter params:   参数
     - parameter fileData: 文件
     - parameter fileName: 文件名称
     */
    func uploadManyFile(action:String,params:Dictionary<String,String>
        ,fileData:Array<NSData>,fileName:Array<String>) {
        
        _sessionManager.POST(action, parameters:
            
            params, constructingBodyWithBlock: { (formdata:AFMultipartFormData?) in
                //在这里构造图片
                for(var i = 0 ;i < fileData.count; i = i+1){
                formdata!.appendPartWithFileData(fileData[i], name:"file", fileName:fileName[i], mimeType:"image/jpg")
                }
                
            }, success: { (operation:NSURLSessionDataTask?, responseObj:AnyObject?) in
                print(responseObj)
                self.delegate?.responseSuccess(responseObj)
                
        }) { (operation:NSURLSessionDataTask?,error:NSError?) in
            print(error)
            self.delegate?.responseError(error)
        }
    }
    

    
    
}
