//
//  FNUrlRoute.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/10/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

public typealias FNUrlRouteHandleOver = ((_ url: String?, _ modal: Bool?, _ params: Dictionary<String, AnyClass>?) -> ())

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
    
    class func removeAll() {
        FNUrlMatcher.shared.urlDictionary.removeAll()
    }
    
    //仅针对注册过的key，返回false则只能用webview打开
    class func canOpen(url:String) -> Bool {
        let urlTmp = URL.init(string: url)
        let key = (urlTmp?.host)! + (urlTmp?.path)!
        //有注册过 && 注册的类遵循协议
        return (FNUrlMatcher.shared.urlDictionary[key] != nil && (FNUrlMatcher.fetchModuleClass(key: key) as? FNUrlRouteDelegate != nil))
    }
    
    class func setHandleOverBlock(block: @escaping FNUrlRouteHandleOver) {
        urlRouteHandleOverBlock = (block as FNUrlRouteHandleOver)
    }
}
