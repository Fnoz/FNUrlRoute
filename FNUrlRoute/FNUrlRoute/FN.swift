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
        var path = urlTmp?.path
        path = path?.substring(from: (path?.index((path?.startIndex)!, offsetBy: 1))!)
        if (FNUrlMatcher.shared.urlDictionary[path!] != nil) {
            if (FNUrlMatcher.fetchModuleClass(key: path!)?.isSubclass(of: FNUrlRouteDelegate.self))! {
                //fnoztodo webview block
            }
            let module = FNUrlMatcher.fetchModuleClass(key: path!) as! FNUrlRouteDelegate.Type
            let viewController = module.init(params: params) as! UIViewController
            
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
        else {
            //fnoztodo webview block
        }
    }
}
