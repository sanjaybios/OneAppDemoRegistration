//  Created by Sanjay Bhanagade on 04/09/18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

extension NSDictionary {
    class func dictionaryByMerging(baseDictionary: NSDictionary, extensionDictionary: NSDictionary)->NSDictionary {
        
        let resultDictionary = NSMutableDictionary(dictionary: baseDictionary)
        extensionDictionary.enumerateKeysAndObjects({(key, obj, stop) ->Void in
            var setObj = obj
            if self.canMergeValueForKey(key: key, baseDictionary: baseDictionary, object: obj) {
                setObj = NSDictionary.dictionaryByMerging(baseDictionary: baseDictionary[key] as! NSDictionary, extensionDictionary: obj as! NSDictionary)
            }
            resultDictionary[key] = setObj
        })
        return resultDictionary
    }
    
    class func canMergeValueForKey(key: Any, baseDictionary: NSDictionary, object: Any) ->Bool {
        if object is NSDictionary {
            if baseDictionary[key] is NSDictionary {
                return true
            }
        }
        return false
    }
    
    func dictionaryByMergingWithDictionary(extensionDictionary: NSDictionary)->NSDictionary {
        return NSDictionary.dictionaryByMerging(baseDictionary: self, extensionDictionary: extensionDictionary)
    }
}
