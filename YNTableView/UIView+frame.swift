//
//  UIView+frame.swift
//  YNTableView
//
//  Created by qiyun on 16/4/5.
//  Copyright © 2016年 ProDrone. All rights reserved.
//

import Foundation
import UIKit

extension NSString {
    
    func appending(overStr : String ) -> NSString {
        
        return self.stringByAppendingString(overStr)
    }
}

extension UIView {
    
    func width()  -> CGFloat {   return self.bounds.size.width  }
    func height() -> CGFloat {  return self.bounds.size.height  }
    
    func frame_x() -> CGFloat { return self.frame.origin.x  }
    func frame_y() -> CGFloat { return self.frame.origin.y  }
    
    func frame_border_horizontal() -> CGFloat {  return self.frame.origin.x + self.width() }
    func frame_border_vertical() -> CGFloat {  return self.frame.origin.y + self.height() }
}