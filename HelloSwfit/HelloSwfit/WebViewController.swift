//
//  WebViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/14.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate{

    @IBOutlet weak var _title: UILabel!
  
    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var btn_back: UIButton!
    var message:String = String()
    var title1:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(message)
        self._title.text = title1
        self.web.loadRequest(NSURLRequest(URL: NSURL(string:message)!))
        
        self.web.delegate = self
        
       // 为按钮添加事件
        self.btn_back.addTarget(self, action:#selector(ViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
    }
    
    /**
     *按钮的事件处理
     */
    func OnClickBtn(btn_sunbmit: UIButton) {
        self.dismissViewControllerAnimated(true,completion: nil)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(error)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
         print(webView.loading)
    }
}

