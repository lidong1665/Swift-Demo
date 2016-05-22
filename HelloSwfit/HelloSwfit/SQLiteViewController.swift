//
//  SQLiteViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/22.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
/**
 *SQLite的使用
 */
class SQLiteViewController: UIViewController {
    let db_name = "data.db3"

    @IBOutlet weak var btn_submit: UIButton!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var name: UITextField!
    var dbManager : DBManager = DBManager.sharedInstance
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print(nibName);
        
           }
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
        let ddq = dbManager.openDatabase(db_name)
        print("数据打开\(ddq)")
        let sucess = dbManager.createTable()
        print("表创建=\(sucess)")
        
        self.btn_submit.addTarget(self, action:#selector( SQLiteViewController.submitAge(_:)), forControlEvents: .TouchUpInside)
        
        self.btn_submit.backgroundColor = UIColor.blueColor()
        
        
    }
    
    func submitAge(btn:UIButton)  {
        
        let sql = "select * from T_Employee"
        let items =  dbManager.selectAll(sql)
        for item in items {
            Util.showToast(self, message: item.toString())
        }
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
