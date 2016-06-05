//
//  NetWorkingViewModel.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/5.
//  Copyright © 2016年 lidong. All rights reserved.
//

/// 周公解梦ViewModel层

class ZGJMViewModel: ZGJMModelDelegate {
    
        /// model
    var  model:ZGJMModel!
        /// view
    var  view:ZGJMView
    
    /**
     构造方法
     
     - parameter view: <#view description#>
     
     - returns: <#return value description#>
     */
     init(view:ZGJMView){
     self.view = view
     self.model = ZGJMModel(delegate: self)
    }
    
    /**
     获取周公解梦的数据
     */
    func getZGJMData() {
        self.view.showProgress()
        self.model.getZGJMData()
    }
    /**
     错误信息的回调
     
     - parameter error: <#error description#>
     */
    func getDataError(error: String) {
        self.view.hideProgress()
        
    }
    /**
     返回成功的回调
     
     - parameter items: <#items description#>
     */
    
    func getDataSuccess(items: Array<String>) {
        self.view.hideProgress()
        self.view.getZGJM(items)
    }
    
}
