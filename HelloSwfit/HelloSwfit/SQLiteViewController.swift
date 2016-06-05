//
//  SQLiteViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/22.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
/// SQLite的使用
class SQLiteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
        /// 数据库名
    
    var items1 = []
    @IBOutlet weak var btn_submit: UIButton!
    @IBOutlet weak var tb_data: UITableView!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var select: UIButton!
    @IBOutlet weak var name: UITextField!
    var dbManager : DBManager = DBManager.sharedInstance
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
           print(nibName);
    }
    /**
     加载xib
     
     - returns: <#return value description#>
     */
    convenience init() {
        let nibNameOrNil = String?("SQLiteViewController")
        self.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "SQLite学习"
        let sucess = dbManager.createTable()
        print("表创建=\(sucess)")
               tb_data.delegate = self
        tb_data.dataSource = self
        
        self.btn_submit.addTarget(self, action:#selector( SQLiteViewController.submitAge(_:)), forControlEvents: .TouchUpInside)
        
        self.btn_submit.backgroundColor = UIColor.blueColor()
        
        self.select.addTarget(self, action:#selector( SQLiteViewController.selectAllEmp(_:)), forControlEvents: .TouchUpInside)
        selectAllEmp()
    }
    
    
    
    func selectAllEmp() {
        let sql = "select * from T_Employee"
        items1 =  dbManager.selectAll(sql)
        Util.showToast(self, message: "总数 = \(items1.count)")
        self.tb_data.reloadData()
    }
    
    /**
     提交雇员信息
     
     - parameter btn: <#btn description#>
     */
    
    func submitAge(btn:UIButton)  {
        
        let username:String! = self.name.text
        
        let  age_:String! = self.age.text
        
        if (username != nil && age_ != nil){
            let sql = "insert into T_Employee(name,age) values('\(self.name.text!)','\(self.age.text!)')"
            print("sql: \(sql)")
            
            let ii =  dbManager.execSql(sql)
            Util.showToast(self, message: "插入 = \(ii)")
            self.selectAllEmp()
        }else{
            Util.showToast(self, message: "输入框不能为空")
            return
        }

    }
    /**
     查询所有雇员
     
     - parameter btn: <#btn description#>
     */
    
    func selectAllEmp(btn:UIButton)  {
        self.selectAllEmp()
    }
    /**
     更新用户信息
     
     - parameter btn: 按钮
     - parameter en:  雇员
     */
    func UpDateRmp(btn:UIButton,en:Employee)  {
            
        let sql = "update T_Employee set name = 'kkkk',age = '10' where id  = 5"
        
        let items =  dbManager.execSql(sql)
        Util.showToast(self, message: "更新 = \(items)")
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items1.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let emp:Employee = items1[indexPath.row] as! Employee
        cell.textLabel?.text = "姓名："+emp.name+"  年龄 :"+emp.age
        return cell
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        name.resignFirstResponder();
        age.resignFirstResponder()
    }

}