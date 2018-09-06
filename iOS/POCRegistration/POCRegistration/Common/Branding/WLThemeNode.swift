//
//  WLThemeNode.swift
//  ThemeTestApp
//
//  Created by Sanjay Bhanagade on 04/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

let  kImportThemeDeclarationKey = "importTheme";

class WLThemeNode: NSObject {

    var content: NSMutableDictionary?
    var resolvedStyle: NSDictionary?
    var name: String?
    var childThemes: NSArray?
    
    class func nodeWithThemeFile(fileName: String?)->WLThemeNode? {
        if fileName == nil {
            return nil
        }
        let theme = self.loadJSONFile(fileName: fileName!)
        return (theme != nil) ? WLThemeNode(fileName: fileName!, theme: theme!) : nil
    }
    
    required init(fileName: String, theme: NSDictionary) {
        super.init()
        self.name = fileName
        self.setNodeContent(theme: theme)
        self.importChildThemesFromParentTheme(parentTheme: theme)
        self.resolveStyle()
    }
    
    class func loadJSONFile(fileName: String) ->NSDictionary? {
        let jsonData = self.readFileWithName(fileName: fileName, ext: "json")
        if jsonData == nil {
            return nil
        }
        return self.jsonDictionaryFromData(data: jsonData!)
    }
    
    class func readFileWithName(fileName: String, ext: String) ->Data? {
        var data: Data?
        if let path = Bundle.main.path(forResource: fileName, ofType: ext)
        {
            if let jsonData = FileManager.default.contents(atPath: path) {
                data = jsonData
            }
        }
        return data
    }
    
    class func jsonDictionaryFromData(data: Data?)->NSDictionary? {
        if data == nil {
            return nil
        }
        let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        
        return json
    }
    
    func setNodeContent(theme: NSDictionary) {
        self.content = NSMutableDictionary(dictionary: theme)
        self.content?.removeObject(forKey: kImportThemeDeclarationKey)
    }
    
    func resolveStyle() {
        resolvedStyle = [:]
        for chileTheme in self.childThemes! {
            let childDict = chileTheme as! WLThemeNode
            resolvedStyle = resolvedStyle?.dictionaryByMergingWithDictionary(extensionDictionary: childDict.resolvedStyle!)
        }
        resolvedStyle = resolvedStyle?.dictionaryByMergingWithDictionary(extensionDictionary: content!)
    }
    
    func importChildThemesFromParentTheme(parentTheme: NSDictionary) {
        self.childThemes = NSMutableArray()
        if self.themeHasValidChildImport(theme: parentTheme) {
            let parentThemsArray = parentTheme.value(forKey: kImportThemeDeclarationKey) as! NSArray
            for themeImportElement in parentThemsArray {
                if self.isValidThemeImportElement(themeImportElement: themeImportElement) {
                self.importChildThemeWithFileName(fileName: themeImportElement as! String)
                }
            }
        }
    }

    func importChildThemeWithFileName(fileName: String) {
        let childNode = WLThemeNode.nodeWithThemeFile(fileName: fileName)
        if childNode != nil {
            self.childThemes?.adding(childNode as Any as Any)
        }
    }
    
    func isValidThemeImportElement(themeImportElement: Any?) ->Bool {
        return themeImportElement is String
    }
    
    func themeHasValidChildImport(theme: NSDictionary) ->Bool {
        return theme[kImportThemeDeclarationKey] is NSArray
    }
}
