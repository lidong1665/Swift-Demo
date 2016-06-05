//
//  NetWorkingView.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/5.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
/**
 *  周公解梦的view层
 */
protocol  ZGJMView {
    /**
     显示等待进度框
     */
    func showProgress()
    /**
     影藏等待进度框
     */
    func hideProgress()
    /**
     获取服务器返回的数据
     
     - parameter items: <#items description#>
     */
    func getZGJM(items:Array<String>)
    
    
}
