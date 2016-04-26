//
//  masterViewController.swift
//  YNTableView
//
//  Created by qiyun on 16/4/5.
//  Copyright © 2016年 ProDrone. All rights reserved.
//

import UIKit
import Social


class masterViewController: UIViewController{
    
    var composeVC = SLComposeViewController()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        
        self.shareSocial(composeVC)
    }
    
    // MARK: ---- share
    
    func shareSocial(composeViewController : SLComposeViewController) -> Bool {
        
        //判断是否可用
        if !SLComposeViewController.isAvailableForServiceType(SLServiceTypeSinaWeibo) {
            
            print("not available for service ...")
            return false
        }
        
        //初始化
        composeVC = SLComposeViewController.init(forServiceType: SLServiceTypeSinaWeibo)

        self.presentViewController(composeVC, animated: true, completion: nil);
        composeVC.setInitialText("这里的山路十八弯！！！")
        composeVC.addImage(UIImage.init(named: "123.png"))
        
        composeVC.completionHandler = { (result:SLComposeViewControllerResult) in
            // Your code
            
            if result == SLComposeViewControllerResult.Cancelled {
                
                print("cancle ...")
                
            }else if result == SLComposeViewControllerResult.Done{
                
                print("successful...")
            }
        }
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
