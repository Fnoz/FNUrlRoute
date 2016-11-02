//
//  FNUrlRouteHandleOver.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/11/3.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import SafariServices

//在 key 都没有匹配上的时候，处理 url 的 block
var urlRouteHandleOverBlock = { (url: String?, modal: Bool?, params:Dictionary<String, AnyClass>?) in
    let safari = SFSafariViewController.init(url: URL.init(string: url!)!)
    let topViewController = FNUtil.currentTopViewController()
    if (topViewController.navigationController != nil) && !modal! {
        let navigation = topViewController.navigationController
        navigation?.pushViewController(safari, animated: true)
    }
    else {
        topViewController.present(safari, animated: true, completion: nil)
    }
}
