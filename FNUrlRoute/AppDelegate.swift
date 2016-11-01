//
//  AppDelegate.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/10/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit
import SafariServices

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let tabNavi: UINavigationController = UINavigationController(rootViewController: ViewController())
        tabNavi.view.backgroundColor = .white
        self.window!.rootViewController = tabNavi
        self.window!.makeKeyAndVisible()
        
        FNUrlRoute.initUrlRoute(dictionary: ["yyy/goodDetail": GoodDetailViewController.self,
                                             "yyy/shopDetail": ShopDetailViewController.self,
                                             "www.baidu.com/shopDetail.html": ShopDetailViewController.self,
                                             "yyy/login": LoginModule.self])
        FNUrlRoute.setHandleOverBlock { (url, modal, params) in
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
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

