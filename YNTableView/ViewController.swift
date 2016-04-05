//
//  ViewController.swift
//  YNTableView
//
//  Created by qiyun on 16/4/5.
//  Copyright © 2016年 ProDrone. All rights reserved.
//

import UIKit


class ViewController: UIViewController, YNKitToolsDelegate{
    
    var dataArray : NSArray?
    var kitTools = YNKitTools()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //添加tableview
        self.dataArray = ["1".appending("这是个类扩展"),"2","3"]
        kitTools.delegate = self
        self.view.addSubview(kitTools.createTableView(self.view.bounds, datas: self.dataArray!))
        
        
        //自定义UIBarButtonItem
        let customButton = kitTools.createButton(CGRectMake(10, 5, 40, 25),
                                                 title: "向下",
                                                 font: 15)!
        
        let rightBarButton = UIBarButtonItem.init(customView: customButton)
        customButton.addTarget(self, action: #selector(ViewController.rightBarButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    
    func rightBarButtonClick(barButton : UIBarButtonItem){
        
        
        NSLog("button click %@", barButton)
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



