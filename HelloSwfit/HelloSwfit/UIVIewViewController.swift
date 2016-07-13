//
//  UIVIewViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/15.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit
/// UI部分
class UIVIewViewController: UIViewController {

   
    @IBOutlet weak var btn_label_button: UIButton!
    @IBOutlet weak var btn_table_view: UIButton!
    @IBOutlet weak var btn_text_field: UIButton!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        btn_table_view.addTarget(self, action:#selector(UIVIewViewController.OnClickBtn(_:)), forControlEvents: .TouchDown)
        btn_text_field.addTarget(self, action:#selector(UIVIewViewController.OnClickBtn(_:)), forControlEvents: .TouchDown)
        btn_label_button.addTarget(self, action:#selector(UIVIewViewController.OnClickBtn(_:)), forControlEvents: .TouchDown)

    }
    /**
     <#Description#>
     
     - parameter button: <#button description#>
     */
    func OnClickBtn(button:UIButton){
    
        switch button.tag {
            
        case 1:
            let ve = DemoViewController()
            
            self.navigationController?.pushViewController(ve, animated: true)
            print("21")
           
            break
        case 2:
            Util.log_s("lable", message: "第一个按钮")
            Util.openNewViewController("Main", vc: self)
            break
        case 3:
            
            let ve = RealmDemo()
            
            self.navigationController?.pushViewController(ve, animated: true)
            print("21")
             print("31")
            break
        case 4:
            print("41")
            break
        default:
             print("default")
        
        }
       
    }
}
