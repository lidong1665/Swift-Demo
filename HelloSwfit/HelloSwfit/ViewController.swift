 //
//  ViewController.swift
//  HelloSwfit
//
//  Created by lidong on 16/5/8.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        //跳转第三个页面
    @IBOutlet weak var nv_item: UINavigationItem!
    @IBOutlet weak var btn_four: UIButton!
    //跳转第四个页面
    @IBOutlet weak var btn_third: UIButton!
    //提交按钮
    @IBOutlet weak var btn_sunbmit: UIButton!
    //开关按钮
    @IBOutlet weak var switch_sex: UISwitch!
    //Label
    @IBOutlet weak var lb_text: UILabel!
    //ImageView控件
    @IBOutlet weak var icon: UIImageView!
    //加载控件
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    //一般情况下不用用到，除非需要重写设置View
    override func loadView() {
        super.loadView() //不需要调用父类的方法，调用会影响CPU的效率
        print("loadView")
    }
    
    //视图加载完成之后的设置和视图销毁的时候调用
    override func viewDidLoad() {
        super.viewDidLoad()
        // 往右侧添加多个按钮
        let item1 = UIBarButtonItem(title: "A", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.tapBarButton(_:)))
       
        item1.width = 40

        let item2 = UIBarButtonItem(title: "B", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.tapBarButton(_:)))
        
        item2.width = 40

        // 往右侧添加多个按钮
        let item3 = UIBarButtonItem(title: "C", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.tapBarButton(_:)))
        
          item3.width = 40
        
        let leftBarBtn = UIBarButtonItem(title: "返回", style: .Plain, target: self,action:nil)
        
        let img:UIImage = UIImage(named: "btn_back_bg.png")!
        
        leftBarBtn.image = img
        
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil,action: nil)
        spacer.width = -25;
        
        self.navigationItem.leftBarButtonItems = [spacer, leftBarBtn]
        // 第一个在最右侧
        self.nv_item.rightBarButtonItems = [item1, item2,item3]
        //设置页面的标题
       
        print("viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
        
        //简单的数据转换
        handleData()
        //开启loading加载的动画
        self.loading.startAnimating()
        //为ImageView设置图片
        
       
        
         
        //为按钮添加事件
        self.btn_sunbmit.addTarget(self, action:#selector(ViewController.OnClickBtn(_:)), forControlEvents: UIControlEvents.TouchDown)
        //为按钮添加事件
        self.btn_third.addTarget(self, action:#selector(ViewController.OnClickBtnThrid(_:)), forControlEvents: UIControlEvents.TouchDown)
        //为按钮添加事件
        self.btn_four.addTarget(self, action:#selector(ViewController.OnClickBtnFour(_:)), forControlEvents: UIControlEvents.TouchDown)
        //为开关添加事件
        switch_sex.addTarget(self, action: #selector(ViewController.changeSwtich(_:)),
                             forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    func OnClickBtnThrid(btnThrid:UIButton){
        self.openNewViewController("Main", dec: "Thrid")
    }
    
    func OnClickBtnFour(btnFour:UIButton) {
        print("33333")
        self.performSegueWithIdentifier("foo", sender: self)
    }
    
    //UIViewController对象的视图即将加入窗口时调用；
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
    }
    
    //UIViewController对象的视图已经加入到窗口时调用；
    override func viewDidAppear(animated: Bool) {
       
        print("viewDidAppear")
    }
    
    //UIViewController对象的视图即将消失、被覆盖或是隐藏时调用；
    override func viewWillDisappear(animated: Bool) {
        print("viewWillDisappear")
    }
    
    //UIViewController对象的视图已经消失、被覆盖或是隐藏时调用；
    override func viewDidDisappear(animated: Bool) {
        print("viewDidDisappear")
    }
    
    
    
//    override func viewWillUnload() {
//     print("viewWillUnload")
//    }
//    
//    override func viewDidUnload() {
//    print("viewDidUnload")
//    }
    
    /**
    *开关的事件处理
     */
    
    func changeSwtich(swith:UISwitch) {
        if swith.on {
           print("open")
        }else{
           print("closeed")
        }
    }
    
    func handleData() {
        
        
        print("Hello Swfit")
        //定义常量
        let _s = "I love  you！"
        //定义变量
        var context:String
        context = "不错啊！"
        print(context)
        print(_s)
        //定义数组
        let ss = ["1111","2222","3222","43333","5555","66666","77777"];
        for  item in ss {
            print(item)
        }
        //调用方法
        let sss = self.add(12, j: 12,k: 56)
        print(sss)

        
//        Int转换Float或Double：
        
        
        let intVar : Int = 3
        let doubleVar : Double = Double(intVar)
        
        print(doubleVar)
//        Int转换为String：
        
        
        let intVar1 : Int = 3
        let strVar1 : String = String(intVar1)
        print(strVar1)
        
//        String转换为Int：
        
        
        let strVar2 : String = "123"
        let intVar2 : Int? = Int(strVar2)
        print(intVar2)
    }
    
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
    
   /**
   *按钮的事件处理
   */
    func OnClickBtn(btn_sunbmit: UIButton) {
        btn_sunbmit.setTitle("nihao", forState: (.Normal))
        btn_sunbmit.setTitleColor(UIColor.blueColor(), forState: (.Normal))
        var s:Int
           s = self.add(12, j: 32, k: 232)
        self.lb_text.text = String(s)
        print("按钮点击了？")
        //关闭load动画
        loading.stopAnimating()
        
        self.openNewViewController("Main", dec: "Second")
        
    
    }
    /**
    *
    *页面跳转
    *
    */
    func openNewViewController(src:String,dec:String){
        
        let mainStoryboard = UIStoryboard(name: src, bundle: NSBundle.mainBundle())
        let vc : UIViewController = mainStoryboard.instantiateViewControllerWithIdentifier(dec) as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    
    /**
    *加法的实现
    */
    
    func add( i:Int,j:Int,k:Int) -> Int {
        return i+j*k;
    }
    //当系统发出内存警告时，会调用didReceiveMemoeryWarning方法，如果当前有能被释放的view，系统会调用viewWillUnload方法来释放view，完成后调用viewDidUnload方法，至此，view就被卸载了。此时原本指向view的变量要被置为nil，
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReceiveMemoryWarning")
    }

    
    //生命周期方法执行顺序：alloc -> initWithNibName -> loadView -> viewDidLoad -> viewWillAppear -> viewDidAppear -> viewWillDisappear -> viewDidDisappear -> dealloc
    
     //loadView和viewDidLoad的区别就是，loadView时view还没有生成，viewDidLoad时，view已经生成了，loadView只会被调用一次，而viewDidLoad可能会被调用多次（View可能会被多次加载），当view被添加到其他view中之前，会调用viewWillAppear，之后会调用viewDidAppear。当view从其他view中移除之前，调用viewWillDisAppear，移除之后会调用viewDidDisappear。当view不再使用时，受到内存警告时，ViewController会将view释放并将其指向为nil。
    
    
    
    //Item 事件
    func next()
    {
        print("点击了下一页");
    }
    
    func tapBarButton(kk:UIBarButtonItem) {
        let title:String = kk.title!
        if "A" == title {
            print("AAA")
        }else if "B" == title{
            print("BBB")
        }else{
            print("CCC")
            self.navigationController?.popViewControllerAnimated(false)
        }
        print("tapBarButton")
    }
    
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

