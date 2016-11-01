//
//  LoginModule.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/11/1.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class LoginModule: FNUrlRouteDelegate  {
    
    required init(params: [String: AnyObject]?) {
        print(params)

        let alert:UIAlertController = UIAlertController(title: "登录", message: nil, preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField(configurationHandler: {
            (text:UITextField) in
                text.placeholder = "账户"
            })
        alert.addTextField(configurationHandler: {
            (text:UITextField) in
                text.placeholder = "密码"
            })
        let closeAlert:UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let okAlert:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(closeAlert)
        alert.addAction(okAlert)
        FNUtil.currentTopViewController().present(alert, animated: true, completion: nil)
    }

}
