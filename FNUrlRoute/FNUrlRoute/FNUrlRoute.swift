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
    /*
     !!! 为了方便起见，具体跳转方式用 FN.swift 中的方法实现
     !!! 比如 FN.open(url: "xxxxxxx")
     */

    //初始化的时候批量注册
    class func initUrlRoute(dictionary: Dictionary<String, AnyClass>?) {
        FNUrlMatcher.shared.urlDictionary = dictionary!
    }
    
    //注册某个 key 和 module
    class func register(key: String, module: AnyClass) {
        FNUrlMatcher.shared.urlDictionary.updateValue(module, forKey: key)
    }
    
    //注销某个 key 对应的 module
    class func remove(key: String) {
        FNUrlMatcher.shared.urlDictionary.removeValue(forKey: key)
    }
    
    //注销所有的 key 对应的 module
    class func removeAll() {
        FNUrlMatcher.shared.urlDictionary.removeAll()
    }
    
    //校验url对应的 host + path 是否为被注册的 key
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
