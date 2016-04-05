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
        
        self.dataArray = ["1","2","3"]
        kitTools.delegate = self
        self.view.addSubview(kitTools.createTableView(self.view.bounds, datas: self.dataArray!))
    }
    
    
    func tableViewNumberOfRowsInSection(section: Int) {
        
        NSLog("点击" + "%d", section);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



