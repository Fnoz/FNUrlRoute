//
//  ViewController.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/10/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "FNUrlRoute Demo"
        
        let btn0 = generateBtn(frame: CGRect.init(x: 0, y: 70, width: view.bounds.width, height: 90), tag: 100)
        btn0.setTitle("FN.open(url: \"xxx://yyy/goodDetail?goodId=123\")\n用push方式打开GoodDetailViewController", for: .normal)
        view.addSubview(btn0)
        
        let btn1 = generateBtn(frame: CGRect.init(x: 0, y: 190, width: view.bounds.width, height: 90), tag: 101)
        btn1.setTitle("FN.open(url: \"xxx://yyy/shopDetail?shopId=456\", modal:true, params:[\"shopId\": \"123\" as AnyObject])\n用present方式打开GoodDetailViewController", for: .normal)
        view.addSubview(btn1)
        
        let btn2 = generateBtn(frame: CGRect.init(x: 0, y: 310, width: view.bounds.width, height: 90), tag: 102)
        btn2.setTitle("FN.open(url: \"http://www.baidu.com/shopDetail.html?shopId=123\")\n由于在注册的时候\"www.baidu.com/shopDetail.html\"被注册成key了，所以用push方式打开GoodDetailViewController", for: .normal)
        view.addSubview(btn2)
        
        let btn3 = generateBtn(frame: CGRect.init(x: 0, y: 430, width: view.bounds.width, height: 90), tag: 103)
        btn3.setTitle("FN.open(url: \"xxx://yyy/login\")\n用urlRoute方式调起登录模块（非ViewController）", for: .normal)
        view.addSubview(btn3)
        
        let btn4 = generateBtn(frame: CGRect.init(x: 0, y: 550, width: view.bounds.width, height: 90), tag: 104)
        btn4.setTitle("FN.open(url: \"http://www.weidian.com\")\n没有对应的模块，则调用自己定义的HandleOverBlock（默认是用SFSafariViewController打开web）", for: .normal)
        view.addSubview(btn4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func btnClicked(btn: UIButton) {
        switch btn.tag - 100 {
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
    
    func generateBtn(frame: CGRect, tag: NSInteger) -> UIButton {
        let btn = UIButton.init(frame: frame)
        btn.backgroundColor = .red
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        btn.titleLabel?.numberOfLines = 0
        btn.tag = tag
        btn.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        return btn
    }
}
