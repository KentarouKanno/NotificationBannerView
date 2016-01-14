//
//  NotificationBannerView.swift
//  NotificationBannerView
//
//  Created by KentarOu on 2016/01/15.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class NotificationBannerView: UIView {

    var backgroundCol: UIColor = UIColor.blueColor()
    
    var text: String = "Banner TEST"
    var textLabel: UILabel = UILabel()
    var textLabelFont: UIFont = UIFont.systemFontOfSize(12)
    var textLabeltextColor = UIColor.whiteColor()
    var baseView: UIView = UIView()
    var bannerheight: CGFloat = 44
    
    var collectionView: UICollectionView!
    var viewController: UIViewController!
    var isVisible: Bool = false
    
    var naviBarHeight: CGFloat = 64
    
    // animation time
    var showDuration   : NSTimeInterval = 0.5
    var dismissDuration: NSTimeInterval = 0.5
    var interval       : NSTimeInterval = 2.0
    
    func generateBannerView(collectionView: UICollectionView, ViewController: UIViewController) {
        self.viewController = ViewController
        self.collectionView = collectionView
        
        naviBarHeight = getNaviBarHeight()
        
        
        self.frame = CGRectMake(0, naviBarHeight - bannerheight, CGRectGetWidth(collectionView.frame), bannerheight)
        
        textLabel.frame = CGRectMake(20, 0, self.frame.size.width - 40, bannerheight)
        textLabel.numberOfLines = 2
        textLabel.text = self.text
        textLabel.font = textLabelFont
        textLabel.textColor = textLabeltextColor
        self.addSubview(textLabel)
        self.backgroundColor = backgroundCol
        ViewController.view.addSubview(self)
    }
    
    func showBanner() {
        
        if !isVisible {
            naviBarHeight = getNaviBarHeight()
            isVisible = true
            
            UIView.animateWithDuration(showDuration, animations: { () -> Void in
                self.frame = CGRectMake(0, self.naviBarHeight , CGRectGetWidth(self.collectionView.frame), self.bannerheight)
                }) { (finish) -> Void in
                    
                    UIView.animateWithDuration(self.dismissDuration, delay: self.interval, options: .OverrideInheritedCurve, animations: { () -> Void in
                        self.frame = CGRectMake(0, self.naviBarHeight - self.bannerheight, CGRectGetWidth(self.collectionView.frame), self.bannerheight)
                        }, completion: { finish in self.isVisible = false })
            }
        }
    }
    
    
    func getNaviBarHeight() -> CGFloat  {
        
        let statusBarHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.height
        let navBarHeight: CGFloat? = self.viewController.navigationController?.navigationBar.frame.size.height
        
        if let navBarHeight = navBarHeight {
            return navBarHeight + statusBarHeight
        }
        
        return statusBarHeight
    }
}
    