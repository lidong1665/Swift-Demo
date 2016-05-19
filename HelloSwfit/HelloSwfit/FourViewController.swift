//
//  FourViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/10.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class FourViewController:  UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var _title: UILabel!
    @IBOutlet weak var lab_back: UIButton!
    @IBOutlet weak var tb_wexin: UITableView!
    var pno:Int = 0
    var lable:UILabel!
    
    var items:Array<WeiXinMessage> = Array<WeiXinMessage>()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        initData()
        
        self.tb_wexin.dataSource = self
        self.tb_wexin.delegate = self
        self._title.text = "微信新闻"
        // 为按钮添加事件
        self.lab_back.addTarget(self, action:#selector(ViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
    }
    
    
    
    func initData() {
    
        let _sessionManager = AFHTTPSessionManager()
        
        let  url = "http://v.juhe.cn/weixin/query"
        
        let  params = ["key":"f16af393a63364b729fd81ed9fdd4b7d",
                       "pno":pno,"ps":"50"]
        
        _sessionManager.POST(url,parameters:params,
                            success: { (
                                operation:NSURLSessionDataTask?, responseObj:AnyObject?) in
//                                print(responseObj)
                    if let jsonResult = responseObj as? Dictionary<String, AnyObject> {
                    if jsonResult["reason"]! as! String == "success"{
                    let result = jsonResult["result"]
                    if let resultList = result as? Dictionary<String,AnyObject>
                                    {
                        let winXinlist = WeiXinList()
                        winXinlist.totalPage = Int(resultList["totalPage"]!.integerValue)
                        winXinlist.pno = Int(resultList["pno"]!.integerValue)
                        winXinlist.ps = Int(resultList["ps"]!.integerValue)
                        if let ll = resultList["list"] as? Array<AnyObject>{
                        // print(index)
                          for index in ll as! [[String: AnyObject]] {
                            
                            let weixinMessage = WeiXinMessage()
                            weixinMessage.id = (index["id"]! as? String)
                            weixinMessage.title = (index["title"]! as? String)
                            weixinMessage.mark = (index["mark"]! as? String)
                            weixinMessage.source = (index["source"]! as? String)
                            weixinMessage.url = (index["url"]! as? String)
                            weixinMessage.firstImg = (index["firstImg"]! as? String)
                            self.items.append(weixinMessage)
                            
                        }
                            self.tb_wexin.reloadData()
                        }
                        }
                        }else{
                        print("服务器失败了啊")
                        }
                        
                                }else{
                                        print("没有数据")
                                        
                                    }
                            
                                
                                
            }, failure: { (operation :NSURLSessionDataTask?, error:NSError?) in
                
                print("错误\(error)  ------  \(operation)")
        })

    }
    
    
    //每一块有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    // //绘制cell
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    //每个cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let initIdentifier = "Cell"
        var cell = tb_wexin.dequeueReusableCellWithIdentifier(initIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: initIdentifier)
        }
        
        //下面两个属性对应subtitle
        cell!.textLabel?.text = items[indexPath.row].title!
        cell!.detailTextLabel?.text = items[indexPath.row].source!
        
        /**
         *  初始化URL并且获取图片地址
         */
       let s =  items[indexPath.row].firstImg!
//        print("s = \(s)")
        if !s.isEmpty {
            let url : NSURL = NSURL(string: s)!
            /**
             *  初始化data。从URL中获取数据
             */
            let data : NSData = NSData(contentsOfURL:url)!
            /**
             *  创建图片
             */
            let image = UIImage(data:data)
            
            //添加照片
            cell!.imageView!.layer.masksToBounds = true
            cell!.imageView!.layer.cornerRadius = 5
            cell!.imageView!.layer.borderWidth = 2
            cell!.imageView?.image = image
//            let frame = CGRect(x: 20, y: 20, width: 40, height: 40)
//            cell!.imageView!.frame = frame
            cell!.imageView!.contentMode = .ScaleAspectFill
        }
        
        

        return cell!
    }
    
    var url:String = String()
    var title1:String = String()
    //选中那个
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("0000== \(items[indexPath.row].firstImg!)")
        url = items[indexPath.row].url!
        title1 = items[indexPath.row].title!
        self.performSegueWithIdentifier("four_segue", sender: self)
    }
    
    //取消选中
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    /**
    *传值处理
    **/
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
        let dev=segue.destinationViewController as! WebViewController
        
        //segue 在sb 中的传值
        
        dev.message = url
        dev.title1 = title1
    }
    
    
    
    /**
     *按钮的事件处理
     */
    func OnClickBtn(btn_sunbmit: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true,completion: nil)
    }
    
}