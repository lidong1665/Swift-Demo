//
//  File.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/14.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
/**
 *微信的内容
 */
class WeiXinMessage {
    
    var id:String?//编号
    var title:String?//标题
    var source:String?//来源
    var firstImg:String?//第一张图片
    var mark:String?//标记
    var url:String?//URL
    
    
    func toString(){
    print("id=\(id) title=\(title)  source=\(source) firstImg=\(firstImg) mark=\(mark) url=\(url) ")
    }
    
}