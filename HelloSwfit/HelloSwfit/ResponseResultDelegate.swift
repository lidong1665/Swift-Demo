//
//  ResponseResult.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/5.
//  Copyright © 2016年 lidong. All rights reserved.
//

/**
 *  网络请求响应结果的回调
 */
protocol ResponseResultDelegate {
    
    
    /**
     响应成功的回调
     
     - parameter response: 成功的信息
     */
     func responseSuccess(responseObj:AnyObject?)
    /**
     响应失败的回调
     
     - parameter responseError: 失败的信息
     */
     func responseError(responseObj:AnyObject?)
    
}