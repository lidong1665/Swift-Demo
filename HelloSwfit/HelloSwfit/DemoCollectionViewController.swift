//
//  Demo.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/15.
//  Copyright © 2016年 lidong. All rights reserved.
//

import UIKit


class DemoViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    lazy var imageArray: [String] = {
        
        var array: [String] = []
        
        for i in 1...200 {
            array.append("Swift\(i)")
        }
        
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "UICollectionView学习"
        
        
        let collectionView =  UICollectionView(frame: CGRectMake(0, 0, self.view.bounds.width, 400), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.blackColor()
        collectionView.dataSource  = self
        collectionView.delegate = self
        
        collectionView.registerClass(ImageTextCell.self, forCellWithReuseIdentifier: "ImageTextCell")
        self.view.backgroundColor = UIColor.blueColor()
        self.view.addSubview(collectionView)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageTextCell", forIndexPath: indexPath) as! ImageTextCell
        cell.imageStr = self.imageArray[indexPath.item]
        cell.imageView?.image = UIImage(named: "icon.png")
        
        return cell
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        Util.showToast(self, message: self.imageArray[indexPath.item])
    }
    
}
//这里是自定义cell的代码
class ImageTextCell: UICollectionViewCell {
    
    var imageView: UIImageView?
    var imageStr: NSString? {
        
        didSet {
            self.imageView!.image = UIImage(named: self.imageStr as! String)
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.imageView = UIImageView()
        self.addSubview(self.imageView!)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

