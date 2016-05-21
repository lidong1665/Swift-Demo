//
//  SecondViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/9.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var btn_back: UIButton!
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
        self.btn_login.addTarget(self, action:#selector(SecondViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
        self.lb_title.text = "用户登录"
        // 为按钮添加事件
        self.btn_back.addTarget(self, action:#selector(SecondViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    /**
    *
    *处理登录按钮事件
    */
    func OnClickBtn(open:UIButton){
        if open.tag == 20 {
            
            let username:String! = self.tv_username.text
            
            let  pwd:String! = self.tv_pwd.text
            
            print("用户名    \(username)  "+"密码    \(pwd)")
            
            let pick:UIImagePickerController = UIImagePickerController()
            
            pick.delegate = self
            
            self.presentViewController(pick, animated: true, completion: nil)

        }else {
             print("33333")
             self.dismissViewControllerAnimated(true,completion: nil)


        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let imageview:UIImageView = UIImageView(frame: CGRectMake(20, 400, 80, 100))
        
        let gotImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageview.image = gotImage
        self.view.addSubview(imageview)
        print(info);
        
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
       print(picker)
    }
}