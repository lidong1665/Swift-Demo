//
//  NetController.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/6.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation

class NetController: UIViewController {
    
    
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var btnGet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        btnPost.addTarget(self, action:#selector(NetController.OnClickBtn(_:)), forControlEvents: .TouchDown)
        btnGet.addTarget(self, action:#selector(NetController.OnClickBtn(_:)), forControlEvents: .TouchDown)
    }
    
    
    /**
     <#Description#>
     
     - parameter button: <#button description#>
     */
    func OnClickBtn(button:UIButton){
        
        switch button.tag {
            
        case 10:
            let ve = ZGJMDemoMVVM()
            self.navigationController?.pushViewController(ve, animated: true)
            break
        case 20:
            Util.openNewViewController("Four", vc: self)
            break
        default:
            break
        }
    }
    
}
