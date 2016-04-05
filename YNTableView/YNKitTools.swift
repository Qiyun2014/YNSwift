//
//  YNKitTools.swift
//  YNTableView
//
//  Created by qiyun on 16/4/5.
//  Copyright © 2016年 ProDrone. All rights reserved.
//

import UIKit


@objc public protocol YNKitToolsDelegate : NSObjectProtocol{
    
    //public func (tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    optional func tableViewNumberOfRowsInSection (section : Int)
    optional func tableViewDidSelectRowAtIndexPath (indexPath : NSIndexPath)
}



class YNKitTools: NSObject , UITableViewDelegate, UITableViewDataSource{
    
    var dataArray : NSArray?
    weak var delegate: YNKitToolsDelegate!
    
    
    
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
        
        //代理
        if (delegate != nil && delegate!.respondsToSelector(#selector(YNKitToolsDelegate.tableViewNumberOfRowsInSection(_:)))) {
            
            NSLog("ReturnVoid is implemented")
            delegate.tableViewNumberOfRowsInSection!(indexPath.row)
        }
        
        if indexPath.row == 1 {
            
            //let vc = masterViewController()
            //vc.title = "masterViewController"
            //vc.view.backgroundColor = UIColor.blueColor()
            //self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    
    // MARK:    ----- button create ------
    
    internal func createButton(frame : CGRect, title : String? , font : UIFont) -> UIButton?{
        
        let button = UIButton.init(type: UIButtonType.System)
        button.frame = frame;
        button.setTitle(title, forState: UIControlState.Normal)
        button.titleLabel!.font = font
        
        return button
    }
    
    
    // MARK:    ----- tableView create ------
    
    internal func createTableView(frame : CGRect , datas : NSArray) -> UITableView{
        
        self.dataArray = datas
        
        let tableView = UITableView(frame: frame, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView.init(frame: frame)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine;
        
        return tableView
    }

}
