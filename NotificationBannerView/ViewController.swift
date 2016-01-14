//
//  ViewController.swift
//  NotificationBannerView
//
//  Created by KentarOu on 2016/01/14.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let banner = NotificationBannerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        banner.generateBannerView(myCollectionView, ViewController: self)
        banner.showBanner()
    }
    
    // MARK: - UICollectionViewDelegate Protocol
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:CustomCell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        cell.title.text = "タイトル";
        cell.image.image = UIImage(named: "iphone.png")
       // cell.backgroundColor = UIColor.redColor()
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func showBanner(sender: UIButton) {
        banner.showBanner()
    }
}

