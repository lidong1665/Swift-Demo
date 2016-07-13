//
//  NetController.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/6.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation

class NetController: UIViewController {
    
    
    @IBOutlet weak var btn_web_view: UIButton!
    @IBOutlet weak var btnUpload: UIButton!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var btnGet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        btnPost.addTarget(self, action:#selector(NetController.OnClickBtn(_:)), forControlEvents: .TouchDown)
        btnGet.addTarget(self, action:#selector(NetController.OnClickBtn(_:)), forControlEvents: .TouchDown)
        
        btnUpload.addTarget(self, action:#selector(NetController.OnClickBtn(_:)), forControlEvents: .TouchDown)
    }
    
    
    /**
     <#Description#>
     
     - parameter button: <#button description#>
     */
    func OnClickBtn(button:UIButton){
        let util:Util = Util()

        
        switch button.tag {
            
        case 10:
            let ve = NetBlockDemo()
            self.navigationController?.pushViewController(ve, animated: true)
            break
        case 20:
            util.presentNavController_s("Four", title: "POST请求", nowViewController: self)
            break
            
        case 30:
            util.presentNavController_s("Second", title: "图片上传请求", nowViewController: self)
            break
        default:
            break
        }
    }
    
}
