//
//  SecondViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/9.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
class SecondViewController: BaseViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ResponseResultDelegate{
    
    @IBOutlet weak var lb_title: UILabel!
    @IBOutlet weak var btn_back: UIButton!
    //密码框
    @IBOutlet weak var tv_pwd: UITextField!
    //按钮
    @IBOutlet weak var btn_login: UIButton!
    //用户名
    @IBOutlet weak var tv_username: UITextField!
    
    let aFUtils = AFNetWorkingUtil.sharedInstance

    
    override func viewDidLoad() {
        super.viewDidLoad();
              
        //设置登录按钮的文字
        btn_login.setTitle("登录", forState:(.Normal))
        //添加事件监听器
        self.btn_login.addTarget(self, action:#selector(SecondViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
        self.lb_title.text = "用户登录"
        // 为按钮添加事件
        self.btn_back.addTarget(self, action:#selector(SecondViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
        aFUtils.delegate = self
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
        let data:NSData = UIImageJPEGRepresentation(gotImage, 0.3)!
        let url = "http://192.168.1.12:8080/LoginDemo/upload";
        let pa:Dictionary<String,String> = ["desciption":"iiiiiiii"]
//        aFUtils.uploadFile(url, params: pa, fileData: data, fileName: "00000");
        var fs:Array<NSData> = [NSData]()
        var fileNames:Array<String> = [String]()
        fs.append(data)
        fs.append(data)
        fileNames.append("000000")
        fileNames.append("222222")
        aFUtils.uploadManyFile(url, params: pa, fileData: fs, fileName: fileNames)
        print("----info------")
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("----------")
        print(picker)
        print("00000000000")
    }
    
    func responseError(responseObj: AnyObject?) {
        print("服务器不能接收，图片太大了")
    }
    func responseSuccess(responseObj: AnyObject?) {
        print("服务器接收成功，哈哈哈")
    }
}