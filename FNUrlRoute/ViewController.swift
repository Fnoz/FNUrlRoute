//
//  ViewController.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/10/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "FNUrlRoute Demo"
        
        let tableView = UITableView.init(frame: view.bounds)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let descArray = ["FN.open(url: \"xxx://yyy/goodDetail?goodId=123\")\n用push方式打开GoodDetailViewController",
                         "FN.open(url: \"xxx://yyy/shopDetail?shopId=456\", modal:true, params:[\"shopId\": \"123\" as AnyObject])\n用present方式打开GoodDetailViewController",
                         "FN.open(url: \"http://www.baidu.com/shopDetail.html?shopId=123\")\n由于在注册的时候\"www.baidu.com/shopDetail.html\"被注册成key了，所以push方式打开GoodDetailViewController",
                         "FN.open(url: \"xxx://yyy/login\")\n用urlRoute方式调起登录模块（非ViewController）",
                         "FN.open(url: \"http://www.weidian.com\")\n没有对应的模块，则调用自己定义的HandleOverBlock（默认是用SFSafariViewController打开web）"]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
        cell?.textLabel?.text = descArray[indexPath.row]
        cell?.textLabel?.numberOfLines = 0
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell?.textLabel?.textColor = .white
        cell?.contentView.backgroundColor = (indexPath.row % 2 == 0 ? .red : .orange)
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            FN.open(url: "xxx://yyy/goodDetail?goodId=123")
        case 1:
            FN.open(url: "xxx://yyy/shopDetail?shopId=456", modal:true, params:["shopId": "123" as AnyObject])
        case 2:
            FN.open(url: "http://www.baidu.com/shopDetail.html?shopId=123")
        case 3:
            FN.open(url: "xxx://yyy/login")
        case 4:
            FN.open(url: "http://www.weidian.com")
        default:
            break
        }
    }
}
