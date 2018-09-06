//
//  WLTheme.swift
//  ThemeTestApp
//
//  Created by Sanjay Bhanagade on 04/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

let kVariablesKey = "Variables"

class WLTheme: NSObject {

    static let sharedInstance: WLTheme = WLTheme()
    private var _theme : NSDictionary? = nil
    private var _namespace : String? = nil
    
    class func withNameSpace(aNameSpace: String, applyTheme:(WLTheme?)->Void) {
        let theme = WLTheme.sharedInstance
        theme.namespace = aNameSpace
        applyTheme(theme)
    }
    
    var theme: NSDictionary? {
        get {
           return _theme
        }
        set(newTheme) {
            _theme = newTheme
        }
    }
    
    var namespace: String? {
        get {
            return _namespace
        }
        set(newNameSpace) {
            _namespace = newNameSpace
        }
    }
    
    func colorForKey(key: String)->UIColor? {
        var color: UIColor? = nil
        let value = self.objectForKey(key: key) as? String
        if value != nil {
            color = self.findColorFromValue(value: value as Any)
        }
        return color
    }
    
    func fontForKey(key: String)->UIFont? {
        var font: UIFont? = nil
        let value = self.objectForKey(key: key) as? NSArray
        if value != nil {
            if value?.count == 2 {
                let size = (value?.object(at: 1) as! NSNumber).floatValue
                let fontName = value?.object(at: 0) as! String
                font = UIFont(name: fontName, size: CGFloat(size))
            }
        }
        return font
    }
    
    func objectForKey(key: String) ->Any? {
        if self.theme == nil {
            return nil
        }
        var newKey: String? = ""
        if self.namespace != nil {
            newKey = self.namespace! + "." + key
        }
        else {
            newKey = key
        }
        
        if let value = _theme?.value(forKeyPath: newKey!) {
            return resolveVariable(value: value)
        }
        else {
            print("WARNING: The requested theme value \(key) is not defined!")
        }
        
        return nil
        
    }
    
    func resolveVariable(value: Any?) ->Any {
        var resolvedValue = value
        if value is String {
            let valueString = value as! String
            if valueString.hasPrefix("$") {
                let temp: String = (valueString as NSString).substring(from: 1)
                let temp2 = self.variables().value(forKeyPath: temp) as! String
                resolvedValue = temp2
                
            }
        }
        else if value is NSArray {
            let mutableValue = NSMutableArray()
            for subValue in value as! NSArray {
                mutableValue.add(self.resolveVariable(value: subValue))
            }
            resolvedValue = mutableValue
        }
        return resolvedValue as Any
    }
    
    func variables() ->NSDictionary {
        return self.theme!.value(forKey: "Variables") as! NSDictionary
    }
    
    class func setupWithFileName(file: String) {
        self.sharedInstance.theme = self.loadThemeFromFile(fileName: file)
        return
    }
    
    class func loadThemeFromFile(fileName: String)->NSDictionary {
        let rootNode = WLThemeNode.nodeWithThemeFile(fileName: fileName)
        return (rootNode?.resolvedStyle)!
    }
    
     // mark - Color management
    func findColorFromValue(value: Any) ->UIColor {
        var color:UIColor? = nil
        if value is String {
            color = colorFromHexString(colorString: value as! String)
            if color == nil {
                color = colorFromSelectorString(selectorString: value as! String)
            }
            
            if color == nil {
                color = colorFromPatternImageString(patternImageString: value as! String)
            }
        }
        else if value is NSArray {
         
            let array = value as! NSArray
            if array.count == 2 {
                color = self.findColorFromValue(value: array[0])
                if color != nil {
                    color = color?.withAlphaComponent(CGFloat(array[1] as! CGFloat))
                }
            }
        }
        
        return color!
    }
    
    func colorFromHexString(colorString: String)->UIColor? {
        
        let red, green, blue: CGFloat
        if colorString.hasPrefix("#") {
            let scanner = Scanner(string: (colorString as NSString).substring(from: 1))
            var  hexValue:UInt64 = 0
            if scanner.scanHexInt64(&hexValue) {
                red = CGFloat((hexValue & 0x00ff0000) >> 16) / 255
                green = CGFloat((hexValue & 0x0000ff00) >> 8) / 255
                blue = CGFloat(hexValue & 0x000000ff) / 255
                return UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0)
            }
        }
        return nil
    }
    
    func colorFromSelectorString(selectorString: String)->UIColor? {
        let colorSelector:Selector = NSSelectorFromString(selectorString)
        if UIColor.responds(to: colorSelector) {
            return UIColor.perform(colorSelector).takeRetainedValue() as? UIColor
        }
        return nil
    }
    
    func colorFromPatternImageString(patternImageString: String)->UIColor? {
        let patternImage = UIImage(named: patternImageString)
        if patternImage != nil {
            return UIColor(patternImage: patternImage!)
        }
        return nil
    }
    
}
