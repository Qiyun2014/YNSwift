//
//  ViewController.swift
//  YNTableView
//
//  Created by qiyun on 16/4/5.
//  Copyright © 2016年 ProDrone. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController, YNKitToolsDelegate, SKStoreProductViewControllerDelegate{
    
    var dataArray : NSArray?
    var kitTools = YNKitTools()

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //添加tableview
        self.dataArray = ["1".appending("这是个类扩展"),"2","3"]
        kitTools.delegate = self
        self.view.addSubview(kitTools.createTableView(self.view.bounds, datas: self.dataArray!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //自定义UIBarButtonItem
        let customButton = kitTools.createButton(CGRectMake(10, 5, 40, 25),
                                                 title: "向下",
                                                 font: 15)!
        
        let rightBarButton = UIBarButtonItem.init(customView: customButton)
        customButton.addTarget(self, action: #selector(ViewController.rightBarButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    //share(textToShare: String, url: String, image: UIImage, sourceView: UIView)
    /// 在app内以子视图方式打开其他app预览，仅支持6.0以上
    private func openAppWithIdentifier(appId: String) {
        
        if (NSClassFromString("SKStoreProductViewController") != nil){
            let storeProductViewController = SKStoreProductViewController()
            storeProductViewController.delegate = self
            let dict = NSDictionary(object:appId, forKey:SKStoreProductParameterITunesItemIdentifier) as! [String : AnyObject]
            storeProductViewController.loadProductWithParameters(dict, completionBlock: { (result, error) -> Void in
                //  self.presentViewController(storeProductViewController, animated: true, completion: nil)
                if ((error?.description) != nil){
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            })
            self.presentViewController(storeProductViewController, animated: true, completion: nil)
        }else {
            UIApplication.sharedApplication().openURL(NSURL(string: "itms-apps://itunes.apple.com/app/id\(appId)")!)
        }
    }
    
    /// 分享文字图片信息，ipad上会以sourceView为焦点弹出选择视图
    private func share(textToShare: String, url: String, image: UIImage, sourceView: UIView) {
        
        let objectsToShare = [textToShare, url, image]
        let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }else {
            let popover = activityViewController.popoverPresentationController
            
            if (popover != nil){
                popover?.sourceView = sourceView
                popover?.sourceRect = sourceView.frame
                popover?.permittedArrowDirections = UIPopoverArrowDirection.Any
                self.presentViewController(activityViewController, animated: true, completion: nil)
            }
        }
    }
    
    func rightBarButtonClick(barButton : UIBarButtonItem){
        
        NSLog("button click %@", barButton)
        let image = UIImage.init(named: "123")
        
        self.share("123", url: "www.google.cn", image: image!, sourceView: self.view)
        //self.openAppWithIdentifier("1073500846");
    }
    
    func tableViewDidSelectRowAtIndexPath(indexPath: NSIndexPath) {
        
        NSLog("点击" + "%d", indexPath.row);
        
        let masterVC = masterViewController()
        masterVC.view.backgroundColor = UIColor.purpleColor()
        self.navigationController?.pushViewController(masterVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



