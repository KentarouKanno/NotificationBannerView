//
//  CustomCollectionViewCell.swift
//  NotificationBannerView
//
//  Created by KentarOu on 2016/01/14.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet var title:UILabel!
    @IBOutlet var image:UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
}
