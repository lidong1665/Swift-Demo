//
//  SecondViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/9.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController {
    
    //密码框
    @IBOutlet weak var tv_pwd: UITextField!
    //按钮
    @IBOutlet weak var btn_login: UIButton!
    //用户名
    @IBOutlet weak var tv_username: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
              
        //设置登录按钮的文字
        btn_login.setTitle("登录", forState:(.Normal))
        //添加事件监听器
        btn_login.addTarget(self, action:#selector(ViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
    }
    
    
    /**
    *
    *处理登录按钮事件
    */
    func OnClickBtn(btn_open:UIButton){
        print("OnClickBtn")
        
        let username:String! = self.tv_username.text
        
        let  pwd:String! = self.tv_pwd.text
        
        print("用户名    \(username)  "+"密码    \(pwd)")
    }
}