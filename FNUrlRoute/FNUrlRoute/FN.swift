//
//  FN.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/10/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FN {
    class func open(url: String) {
        open(url: url, modal:false, params: nil)
    }
    
    class func open(url: String, modal:Bool) {
        open(url: url, modal:true, params: nil)
    }
    
    class func open(url: String, modal: Bool, params: Dictionary<String, AnyObject>?) {
        let urlTmp = URL.init(string: url)
        let key = (urlTmp?.host)! + (urlTmp?.path)!
        //有注册过 && 注册的类遵循协议
        if (FNUrlMatcher.shared.urlDictionary[key] != nil && (FNUrlMatcher.fetchModuleClass(key: key) as? FNUrlRouteDelegate != nil)) {
            
            let paramsWithUrlQuery = FNUtil.mergeDictionary(dic0: FNUtil.getQueryDictionary(url: url), dic1: params)
            
            let moduleType = FNUrlMatcher.fetchModuleClass(key: key) as! FNUrlRouteDelegate.Type
            let module = moduleType.init(params: paramsWithUrlQuery as Dictionary<String, AnyObject>?) as AnyObject
            
            if module.isKind(of: UIViewController.self) {
                let viewController = module as! UIViewController
                if viewController.isKind(of: UIViewController.self) {
                    let topViewController = FNUtil.currentTopViewController()
                    if (topViewController.navigationController != nil) && !modal {
                        let navigation = topViewController.navigationController
                        navigation?.pushViewController(viewController, animated: true)
                    }
                    else {
                        topViewController.present(viewController, animated: true, completion: nil)
                    }
                }
            }
        }
        else {
            urlRouteHandleOverBlock(url, modal, params as! Dictionary<String, AnyClass>?)
        }
    }
}
