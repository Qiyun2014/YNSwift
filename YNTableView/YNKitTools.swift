//
//  YNKitTools.swift
//  YNTableView
//
//  Created by qiyun on 16/4/5.
//  Copyright © 2016年 ProDrone. All rights reserved.
// <https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html>

import UIKit

func someFunctionThatTakesAClosure(closure: (aString : String) -> String) {
    
    // function body goes here
    
}

/**!
 *  声明协议 @objc是关键字
 *  @brief 详情:<https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html>
 */
@objc public protocol YNKitToolsDelegate : NSObjectProtocol{
    
    //获取点击的位置
    optional func tableViewDidSelectRowAtIndexPath(indexPath : NSIndexPath)
    
    /**
     设置指定cell的附件类型
     
     - parameter indexPath: <#indexPath description#>
     - parameter complete:  <#complete description#>
     */
    optional func tableViewForRowWithIndexPath(indexPath : NSIndexPath , complete : ((type : UITableViewCellAccessoryType) -> Void)?)
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
        if delegate != nil && delegate!.respondsToSelector(#selector(YNKitToolsDelegate.tableViewDidSelectRowAtIndexPath(_:))) {
        
            delegate.tableViewDidSelectRowAtIndexPath!(indexPath)
            NSLog("ReturnVoid is implemented")
        }
        
        let timer :NSTimer? = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("action"), userInfo: nil, repeats: true)
        timer?.invalidate()
        
        someFunctionThatTakesAClosure (){_ in
            
            NSLog("body goes here ... ")
            return "123"
        }
        
    }
    
    
    func tableView(tableView: UITableView, accessoryTypeForRowWithIndexPath indexPath: NSIndexPath) -> UITableViewCellAccessoryType {
        
        return UITableViewCellAccessoryType.DisclosureIndicator
    }
    
    
    func tableView(tableView: UITableView, indexPath: NSIndexPath, complete: ((type : UITableViewCellAccessoryType) -> Void)?){

        let cell : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    }
    
    
    // MARK:    ----- label create ------
    
    internal func createLabel(frame : CGRect, title : String?, font : CGFloat ,textAlignment : NSTextAlignment , textColor : UIColor) -> UILabel{
        
        let label = UILabel.init(frame: frame)
        label.text = title
        label.font = UIFont.systemFontOfSize(font)
        label.textAlignment = textAlignment
        label.textColor = textColor
        
        return label
    }
    
    
    // MARK:    ----- button create ------
    
    internal func createButton(frame : CGRect, title : String? , font : CGFloat) -> UIButton?{
        
        let button = UIButton.init(type: UIButtonType.System)
        button.frame = frame;
        button.setTitle(title, forState: UIControlState.Normal)
        button.titleLabel!.font = UIFont.boldSystemFontOfSize(font)
        
        return button
    }
    
    
    // MARK:    ----- tableView create ------
    
    internal func createTableView(frame : CGRect , datas : NSArray) -> UITableView{
        
        someFunctionThatTakesAClosure { (aString) -> String in
            
            NSLog("block = \(123)")
            return "345"
        }

        self.dataArray = datas
        
        let tableView = UITableView(frame: frame, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView.init(frame: frame)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        
        return tableView
    }

}






