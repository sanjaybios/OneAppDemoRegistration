//
//  UIView+WLTheme.swift
//  ThemeTestApp
//
//  Created by Sanjay Bhanagade on 04/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class ThemeHelper: NSObject {
    
    class func Color(key: String) ->UIColor? {
        WLTheme.sharedInstance.namespace = nil
        return WLTheme.sharedInstance.colorForKey(key: key)
    }
    
    class func Font(key: String) ->UIFont? {
        WLTheme.sharedInstance.namespace = nil
        return WLTheme.sharedInstance.fontForKey(key: key)
    }
    
    class func Color_t(theme: WLTheme,key: String) ->UIColor? {
        return theme.colorForKey(key: key)
    }
    
    class func Font_t(theme: WLTheme,key: String) ->UIFont? {
        return theme.fontForKey(key: key)
    }
}
