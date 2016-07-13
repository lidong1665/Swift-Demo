//
//  ThridViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/10.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class ThridViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var ll_title: UILabel!
    
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var tb_data_list: UITableView!
    
    var items:Array = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item
        self.ll_title.text = "周公解梦类型"
        // 为按钮添加事件
        self.btn_back.addTarget(self, action:#selector(ViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
       
        initData()
        
        tb_data_list.dataSource = self
        tb_data_list.delegate = self
    }
    
    
    //初始化数据的方法
    func initData() {
        
//        for  index in 1...100 {
//            items.append("宝宝\(index)")
//        }
        
        let _sessionManager = AFHTTPSessionManager()

        let  url = "http://v.juhe.cn/dream/category"
    
        let  params = ["key":"c73b082b0c150b3bcba2cea1b96a8922"]
        
        _sessionManager.GET(url,
                           parameters:params,
                           success: { (
                            
            operation:NSURLSessionDataTask?, responseObj:AnyObject?) in
//            print(responseObj)
            if let jsonResult = responseObj as? Dictionary<String, AnyObject> {
//
            
                let ss = jsonResult["error_code"]
                print("error_code状态吗 = \(ss)")
                let sss = jsonResult["reason"]
                print("reason=\(sss)")
                let result = jsonResult["result"]
                print("result=\(result)")
                var list = Array<DreamModel>()

                if let ll = jsonResult["result"] as? Array<AnyObject>{
//                     print(index)
                for balance in ll as! [[String: AnyObject]] {
                        let id = balance["id"]
//                        print(id!)
                        let fid = balance["fid"]
//                        print(fid!)
                        let name = balance["name"]
//                        print(name!)

                        let s = DreamModel()
                        s.fid = Int(fid!.integerValue)
                        s.id = Int(id!.integerValue)
                        s.name = name! as? String
                        list.append(s)
                    }
                    let responseDate = ResponseData(error:Int(ss!.integerValue),reason:sss! as! String,result:list)
                    
                    print(responseDate.toString())
                    for index in list{
                       index.toString()
                      self.items.append(index.name!)
                    }
                    
                    self.tb_data_list.reloadData()
                }else{
                print("没有数据")
                
                }
                
            }
           
                            
        }, failure: { (operation :NSURLSessionDataTask?, error:NSError?) in
            
            print("错误\(error)  ------  \(operation)")
        })

        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //每一块有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return items.count
    }
    // //绘制cell
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
       return false
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row]
//        lable.text = items[indexPath.row]
//        cell.addSubview(lable)
        
        return cell;
    }
    
    
    
    
    //cell的点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        print("点击了  \(items[indexPath.row])")
        
    }
    
    
    
    /**
     *按钮的事件处理
     */
    func OnClickBtn(btn_sunbmit: UIButton) {
        self.dismissViewControllerAnimated(true,completion: nil)
        
    }

}
