//
//  FourViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/10.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class FourViewController:  BaseViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var lab_back: UIButton!
    @IBOutlet weak var tb_wexin: UITableView!
    var pno:Int = 1
    var lable:UILabel!
    
    var items:Array<WeiXinMessage> = []

    let cellId = "DemoListID"
    
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tb_wexin.dataSource = self
        self.tb_wexin.delegate = self
        self.items  = Array<WeiXinMessage>()
        let nib = UINib(nibName: "WinXinTableViewCell", bundle: nil) //nibName指的是我们创建的Cell文件名
        self.tb_wexin.registerNib(nib, forCellReuseIdentifier: cellId)
        // 为按钮添加事件
        self.lab_back.addTarget(self, action:#selector(ViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
        
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(FourViewController.headerRefresh))
        // 现在的版本要用mj_header
        self.tb_wexin.mj_header = header
        
        // 上拉刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(FourViewController.footerRefresh))
        self.tb_wexin.mj_footer = footer
        
        headerRefresh()
        self.tb_wexin.mj_header.hidden = false
        self.tb_wexin.mj_footer.hidden = false
    }
    
    
     /**
     *加载数据
     */
    func initData(page:Int){
    
        let _sessionManager = AFHTTPSessionManager()
        
        let  url = "http://v.juhe.cn/weixin/query"
        
        let  params = ["key":"f16af393a63364b729fd81ed9fdd4b7d",
                       "pno":page,"ps":"5"]
        
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
                       
                        if page == 1{
                            self.items.removeAll()
                                        }
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
                            if self.items.count != 0 {
                            self.tb_wexin.reloadData()
                            }
                        }
                                        
                        }else{
                        if self.pno == 1 {
                        self.header.endRefreshing()
                        }
                        self.footer.endRefreshingWithNoMoreData()
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
        
//        Util.log("数据结果", message: arrs.count)
//        
//        return nil

    }
    
    
    //每一块有多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    // //绘制cell
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    //每个cell的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{

        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellId, forIndexPath: indexPath) as! WinXinTableViewCell
        
        if (cell.isEqual(nil)) {
            cell = WinXinTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: self.cellId)
        }
        let win:WeiXinMessage = self.items[indexPath.row]
            //下面两个属性对应subtitle
            if win.id != nil  {
                
                cell.lb_message.text = self.items[indexPath.row].title!
                cell.lb_source.text = "来源: \(self.items[indexPath.row].source!)"
                
                /**
                 *  初始化URL并且获取图片地址
                 */
                let s =  self.items[indexPath.row].firstImg!
                
                //添加照片
                cell.img_icon!.layer.masksToBounds = true
                cell.img_icon!.layer.cornerRadius = 5
                cell.img_icon!.layer.borderWidth = 1
                cell.img_icon!.layer.borderColor = UIColor.greenColor().CGColor
                cell.img_icon!.contentMode = .ScaleAspectFit
                cell.img_icon!.sd_setImageWithURL(NSURL(string: s),placeholderImage: UIImage(named: "icon_app.png"))
                
            }
        

        return cell
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
    
    /**
     <#Description#>
     
     - parameter tableView: <#tableView description#>
     - parameter indexPath: <#indexPath description#>
     */
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
    
    
    // 顶部刷新
    func headerRefresh(){
        pno = 1
        print("下拉刷新")
        // 结束刷新
        initData(pno)
        self.tb_wexin.mj_header.endRefreshing()
    }
    
    // 底部刷新
    var index = 0
    
    func footerRefresh(){
       
        print("上拉刷新")
        self.tb_wexin.mj_footer.endRefreshing()
        // 2次后模拟没有更多数据
        pno += 1
        initData(pno)
        Util.log_i("底部刷新", message: pno)
    }

    
}