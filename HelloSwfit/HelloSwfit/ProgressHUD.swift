//
//  ProgressHUD.swift
//  HelloSwfit
//
//  Created by lidong on 16/6/5.
//  Copyright © 2016年 lidong. All rights reserved.
//

import Foundation

/**
 等待框的类型
 
 - Loading: 加载中
 - Done:    加载完成
 - Error:   加载失败
 - Warning:  警告
 - Custom:  普通类型
 */
public enum ProgressHUDType {
    /** A view with a UIActivityIndicator and "Loading..." title. */
    case Loading
    /** A view with a checkmark and "Done" title. */
    case Done
    /** A view with a cross and "Error" title. */
    case Error
    /** A view with an exclamation point and "Warning" title. */
    case Warning
    /** A view with a background shadow. */
    case Custom
}
/// 封装等待框的实现
public class ProgressHUD : UIView{
    
    
    
    // 单例  通过单例的模式创建对象
    class var sharedInstance: ProgressHUD
    {
        
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : ProgressHUD? = nil
            
        }
        
        dispatch_once(&Static.onceToken) {
            Static.instance = ProgressHUD()
        }
        return Static.instance!
    }
    
    
    
    private let kInsetValue: CGFloat = 6
    private let kFinalViewTag: Int = 1337
    private let kAlertViewTag: Int = 1338
    private let kFadeOutDuration: NSTimeInterval = 0.5
    private let kActivityIndicatorSize: CGFloat = 50
    private let kOtherIconsSize: CGFloat = 30
    
    private var _currentView: UIView?
    
    /**
     * Getter to the current FVCustomAlertView displayed
     * If no alert view is displayed on the screen, the result will be nil
     */
    internal private(set) var currentView: UIView? {
        get {
            return _currentView
        }
        
        set {
            _currentView = newValue
        }
    }
    
    public func showAlertOnView(view: UIView, withTitle title: String?, titleColor: UIColor, width: CGFloat, height: CGFloat, backgroundImage: UIImage?, backgroundColor: UIColor?, cornerRadius: CGFloat, shadowAlpha: CGFloat, alpha: CGFloat, contentView: UIView?, type: ProgressHUDType) {
        // hide current alertView first
        if currentView != nil {
            // must be false
            hideAlertFromView(currentView, fading: false)
        }
        
        // the view is not added to a window yet
        if view.window == nil {
            return
        }
        
        if view.viewWithTag(kFinalViewTag) != nil {
            print("Can't add two FVCustomAlertViews on the same view. Hide the current view first.")
            return
        }
        
        // get window size and position
        let windowRect = UIScreen.mainScreen().bounds
        
        // create the final view with a special tag
        let resultView = UIView(frame: windowRect)
        resultView.tag = kFinalViewTag
        
        // create a shadow view by adding a black background with custom opacity
        let shadowView = UIView(frame: windowRect)
        shadowView.backgroundColor = UIColor.blackColor()
        shadowView.alpha = shadowAlpha
        resultView.addSubview(shadowView)
        
        // create the main alert view centered
        // with custom width and height
        // and custom background
        // and custom corner radius
        // and custom opacity
        let alertView = UIView(frame: CGRectMake(windowRect.size.width / 2 - width / 2, windowRect.size.height / 2 - height / 2, width, height))
        alertView.tag = kAlertViewTag //set tag to retrieve later
        
        // set background color
        // if a background image is used, use the image instead
        alertView.backgroundColor = backgroundColor
        if backgroundImage != nil {
            alertView.backgroundColor = UIColor(patternImage: backgroundImage!)
        }
        alertView.layer.cornerRadius = cornerRadius
        alertView.alpha = alpha
        
        // create the title label centered with multiple lines
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textAlignment = .Center
        titleLabel.textColor = titleColor
        
        // set the number of lines to 0 (unlimited)
        // set the maximum size to the label
        // then get the size that fits the maximum size
        titleLabel.numberOfLines = 0
        let requiredSize = titleLabel.sizeThatFits(CGSizeMake(width - kInsetValue, height - kInsetValue))
        titleLabel.frame = CGRectMake(width / 2 - requiredSize.width / 2, kInsetValue, requiredSize.width, requiredSize.height)
        alertView.addSubview(titleLabel)
        
        // check wheather the alert is of custom type or not
        // if it is, set the custom view
        if type != .Custom || contentView != nil {
            let content = type == .Custom ? contentView! : self.contentViewFromType(type)
            
            content.frame = CGRectApplyAffineTransform(content.frame, CGAffineTransformMakeTranslation(width / 2 - content.frame.size.width / 2, titleLabel.frame.origin.y + titleLabel.frame.size.height + kInsetValue))
            
            alertView.addSubview(content)
        }
        
        resultView.addSubview(alertView)
        
        // tap the alert view to hide and remove it from the superview
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ProgressHUD.hideAlertByTap(_:)))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        resultView.addGestureRecognizer(tapGesture)
        
        // use view's window to let result view cover fullscreen
        view.window?.addSubview(resultView)
        currentView = view
    }
    
    internal func showDefaultLoadingAlertOnView(view: UIView, withTitle title: String) {
        self.showAlertOnView(view, withTitle: title, titleColor: UIColor.whiteColor(), width: 100.0, height: 100.0, backgroundImage: nil, backgroundColor: UIColor.blackColor(), cornerRadius: 10.0, shadowAlpha: 0.1, alpha: 0.8, contentView: nil, type: .Loading)
    }
    
    internal func showDefaultDoneAlertOnView(view: UIView, withTitle title: String) {
        self.showAlertOnView(view, withTitle: title, titleColor: UIColor.whiteColor(), width: 100.0, height: 100.0, backgroundImage: nil, backgroundColor: UIColor.blackColor(), cornerRadius: 10.0, shadowAlpha: 0.1, alpha: 0.8, contentView: nil, type: .Done)
    }
    
    internal func showDefaultErrorAlertOnView(view: UIView, withTitle title: String) {
        self.showAlertOnView(view, withTitle: title, titleColor: UIColor.whiteColor(), width: 100.0, height: 100.0, backgroundImage: nil, backgroundColor: UIColor.blackColor(), cornerRadius: 10.0, shadowAlpha: 0.1, alpha: 0.8, contentView: nil, type: .Error)
    }
    
    internal func showDefaultWarningAlertOnView(view: UIView, withTitle title: String) {
        self.showAlertOnView(view, withTitle: title, titleColor: UIColor.whiteColor(), width: 100.0, height: 100.0, backgroundImage: nil, backgroundColor: UIColor.blackColor(), cornerRadius: 10.0, shadowAlpha: 0.1, alpha: 0.8, contentView: nil, type: .Warning)
    }
    
    internal func showDefaultLoadingAlertOnView(view: UIView, withTitle title: String, withSize size: CGSize) {
        self.showAlertOnView(view, withTitle: title, titleColor: UIColor.whiteColor(), width: size.width, height: size.height, backgroundImage: nil, backgroundColor: UIColor.blackColor(), cornerRadius: 10.0, shadowAlpha: 0.1, alpha: 0.8, contentView: nil, type: .Loading)
    }
    
    internal func showDefaultDoneAlertOnView(view: UIView, withTitle title: String, withSize size: CGSize) {
        self.showAlertOnView(view, withTitle: title, titleColor: UIColor.whiteColor(), width: size.width, height: size.height, backgroundImage: nil, backgroundColor: UIColor.blackColor(), cornerRadius: 10.0, shadowAlpha: 0.1, alpha: 0.8, contentView: nil, type: .Done)
    }
    
    internal func showDefaultErrorAlertOnView(view: UIView, withTitle title: String, withSize size: CGSize) {
        self.showAlertOnView(view, withTitle: title, titleColor: UIColor.whiteColor(), width: size.width, height: size.height, backgroundImage: nil, backgroundColor: UIColor.blackColor(), cornerRadius: 10.0, shadowAlpha: 0.1, alpha: 0.8, contentView: nil, type: .Error)
    }
    
    internal func showDefaultWarningAlertOnView(view: UIView, withTitle title: String, withSize size: CGSize) {
        self.showAlertOnView(view, withTitle: title, titleColor: UIColor.whiteColor(), width: size.width, height: size.height, backgroundImage: nil, backgroundColor: UIColor.blackColor(), cornerRadius: 10.0, shadowAlpha: 0.1, alpha: 0.8, contentView: nil, type: .Warning)
    }
    
    public func contentViewFromType(type: ProgressHUDType) -> UIView {
        let content = UIImageView()
        // generate default content view based on the type of the alert
        switch type {
        case .Loading:
            let spin = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
            spin.startAnimating()
            return spin
        case .Done:
            content.frame = CGRectMake(0, kInsetValue, kOtherIconsSize, kOtherIconsSize)
            content.image = UIImage(named: "progresshud-success")
        case .Error:
            content.frame = CGRectMake(0, kInsetValue, kOtherIconsSize, kOtherIconsSize)
            content.image = UIImage(named: "progresshud-error")
        case .Warning:
            content.frame = CGRectMake(0, kInsetValue, kOtherIconsSize, kOtherIconsSize)
            content.image = UIImage(named: "warning")
        default:
            // FVAlertTypeCustom never reached
            break
        }
        
        return content
    }
    
    internal func fadeOutView(view: UIView?, completion: ((Bool) -> Void)?) {
        UIView.animateWithDuration(kFadeOutDuration, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut,
                                   animations: {
                                    view?.alpha = 0
                                    return
            },
                                   completion: completion
        )
    }
    
    internal func hideAlertFromView(view: UIView?, fading: Bool) {
        let alertView = view?.window?.viewWithTag(kFinalViewTag)
        if fading {
            fadeOutView(alertView, completion: { (finished) in
                alertView?.removeFromSuperview()
                return
            })
        } else {
            alertView?.removeFromSuperview()
        }
        
        // TODO maybe check view is currentView
        currentView = nil
    }
    
    internal func hideAlertByTap(sender: UITapGestureRecognizer) {
        self.fadeOutView(sender.view, completion: {(finished) in
            sender.view?.viewWithTag(self.kFinalViewTag)?.removeFromSuperview()
            self.currentView = nil
        })
    }

}
