//
//  FNUtil.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/10/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNUtil {
    //获取当前页面
    class func currentTopViewController() -> UIViewController {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        return currentTopViewController(rootViewController: rootViewController!)
    }
    
    class func currentTopViewController(rootViewController: UIViewController) -> UIViewController {
        if (rootViewController.isKind(of: UITabBarController.self)) {
            let tabBarController = rootViewController as! UITabBarController
            return currentTopViewController(rootViewController: tabBarController.selectedViewController!)
        }
        
        if (rootViewController.isKind(of: UINavigationController.self)) {
            let navigationController = rootViewController as! UINavigationController
            return currentTopViewController(rootViewController: navigationController.visibleViewController!)
        }
        
        if ((rootViewController.presentedViewController) != nil) {
            return currentTopViewController(rootViewController: rootViewController.presentedViewController!)
        }
        return rootViewController
    }
    
    //获取 url 中的 query 字典
    class func getQueryDictionary(url: String) -> Dictionary<String, AnyObject?>? {
        var dic = [:] as Dictionary<String, AnyObject?>?
        let query = URL.init(string: url)?.query
        if query != nil {
            let queryArray = (query?.components(separatedBy: "&"))! as Array<String>
            
            for index in 0 ... queryArray.count - 1 {
                let queryComponent = queryArray[index]
                let queryComponentPartArray = queryComponent.components(separatedBy: "=") as Array<String>
                if queryComponentPartArray.count >= 2 {
                    dic?.updateValue(queryComponentPartArray[1] as AnyObject?, forKey: queryComponentPartArray[0])
                }
            }
        }
        return dic
    }

    //合并两个字典
    class func mergeDictionary(dic0: Dictionary<String, AnyObject?>?, dic1: Dictionary<String, AnyObject?>?) -> Dictionary<String, AnyObject?>? {
        var dic = dic0
        if dic1 != nil {
            for (key, value) in dic1! {
                dic?.updateValue(value, forKey: key)
            }
        }
        return dic
    }
    
    //url 编码
    class func URLEncode(string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    //url 解码
    class func URLDecode(string: String) -> String {
        return string.removingPercentEncoding!
    }
}
