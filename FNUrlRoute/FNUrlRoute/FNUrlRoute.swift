//
//  FNUrlRoute.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/10/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNUrlRoute {
    
    class func initUrlRoute(dictionary: Dictionary<String, AnyClass>?) {
        FNUrlMatcher.shared.urlDictionary = dictionary!
    }
    
    class func register(key: String, module: AnyClass) {
        FNUrlMatcher.shared.urlDictionary.updateValue(module, forKey: key)
    }
    
    class func remove(key: String) {
        FNUrlMatcher.shared.urlDictionary.removeValue(forKey: key)
    }
    
}
