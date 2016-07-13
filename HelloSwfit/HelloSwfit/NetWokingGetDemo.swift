//
//  NetWokingGetDemo.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/5.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation
import  SwiftyJSON

class NetWokingGetDemo: UITableViewController,
    ResponseResultDelegate {
    
    
    let aFUtils = AFNetWorkingUtil.sharedInstance
    
    
    var items:Array = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aFUtils.delegate = self
        let action:String = "/dream/category"
        let  dic = ["key":"c73b082b0c150b3bcba2cea1b96a8922"]
        aFUtils.get(action, params: dic)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "GET请求"
    }
    
    func responseError(responseObj: AnyObject?) {
        Util.log_s("responseSuccess", message: "服务器异常！")
    }
    
    func responseSuccess(responseObj: AnyObject?) {
        
        let json = JSON(responseObj!)
        
        Util.log_i("responseSuccess", message: json["error_code"].intValue)
        Util.log_s("responseSuccess", message: json["reason"].string!)
        Util.log_i("responseSuccess", message: json["result"].array!.count)
        
        let d =  json["result"].array!.count
        if d > 0  {
           let list: Array<JSON> =  json["result"].array!
            
            for item in list {
                items.append(item["name"].string!)
            }
            self.tableView.reloadData()
        }
        
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
        return cell;
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Util.showToast(self, message: items[indexPath.row])

    }

    
}
