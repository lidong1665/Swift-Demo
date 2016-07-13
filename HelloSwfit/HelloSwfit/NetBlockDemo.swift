//
//  NetBlockDemo.swift
//  HelloSwfit
//
//  Created by lidong on 16/7/7.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation
import SwiftyJSON
/// Block的简单使用
class NetBlockDemo: UITableViewController,ZGJMView
{
    
    var items:Array = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.title = "GET请求"
        
        let vm = WxjxViewModel(view: self)
        vm.getZGJMData()
    }
    
    
    
    func showProgress() {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
    }
    
    
    func hideProgress() {
        MBProgressHUD.hideHUDForView(self.view, animated: true)
    }
    
    
    func getZGJM(items: Array<String>) {
        self.items = items
        print("@@@@@@@@@\(items.count)")
        self.tableView.reloadData()
    }
    
    func getZGJMFailure(error: String) {
        print("000000000000000")
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
