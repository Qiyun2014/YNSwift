//
//  ViewController.swift
//  YNTableView
//
//  Created by qiyun on 16/4/5.
//  Copyright © 2016年 ProDrone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView : UITableView?
    var dataArray : NSArray?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.dataArray = ["1","2","3"]
        
        tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.Plain)
        tableView!.dataSource = self
        tableView!.delegate = self
        tableView!.tableFooterView = UIView.init(frame: CGRectZero)
        tableView!.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        self.view.addSubview(tableView!)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK:    -----  tableView delegate -----
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return self.dataArray!.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyTestCell")
        cell.textLabel?.text = "Row #  \(self.dataArray!.objectAtIndex(indexPath.row))"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 1 {
            
            let vc = masterViewController()
            vc.title = "masterViewController"
            vc.view.backgroundColor = UIColor.blueColor()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}


/*
public func createTableView(frame : CGRect , object : NSObject) -> UITableView{
    
    var tableView = UITableView(frame: frame, style: UITableViewStyle.Plain)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.tableFooterView = UIView.init(frame: CGRectZero)
    tableView.separatorStyle = UITableViewCellSeparatorStyle.None;
    return tableView
    
}
*/

