//
//  StyleKit.swift
//  POCRegistration
//
//  Created by Animesh Bansal on 06/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

open class StyleKit: NSObject {
    
    //// Cache
    fileprivate struct Cache {
        static var defaultTint = UIColor(hex: "11111")
        static var whiteColor = UIColor.white
    }
    
    //// Colors
    open class var defaultTint: UIColor {
        return Cache.defaultTint
    }
    open class var whiteColor: UIColor {
        return Cache.whiteColor
    }
    
}

// extension created for color when ever user want to give alpha value
extension UIColor {
    func colorWithAlpha(_ newAlpha: CGFloat) -> UIColor {
        var hue: CGFloat = 1.0, saturation: CGFloat = 1.0, brightness: CGFloat = 1.0
        getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: nil)
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: newAlpha)
    }
}

// extension created for color when user want to give value in hex
extension UIColor {
    convenience init(hex: NSString, alpha: CGFloat = 1.0) {
        var color: UInt32 = 0xffffff
        
        if hex.hasPrefix("#") {
            Scanner(string: hex.substring(from: 1)).scanHexInt32(&color)
        } else {
            Scanner(string: hex as String).scanHexInt32(&color)
        }
        
        self.init(red: CGFloat((color & 0xff0000) >> 16)/255.0, green: CGFloat((color & 0xff00) >> 8)/255.0, blue: CGFloat(color & 0xff)/255.0, alpha: alpha)
    }
}

// extension created for color when user want to give value in rgb
extension UIColor {
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
