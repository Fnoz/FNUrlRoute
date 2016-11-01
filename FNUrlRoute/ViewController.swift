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
        
        let btn0 = UIButton.init(frame: CGRect.init(x: 0, y: 100, width: view.bounds.width, height: 60))
        btn0.backgroundColor = .red
        btn0.tag = 100
        btn0.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        view.addSubview(btn0)
        
        let btn1 = UIButton.init(frame: CGRect.init(x: 0, y: 190, width: view.bounds.width, height: 60))
        btn1.backgroundColor = .red
        btn1.tag = 101
        btn1.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        view.addSubview(btn1)
        
        let btn2 = UIButton.init(frame: CGRect.init(x: 0, y: 280, width: view.bounds.width, height: 60))
        btn2.backgroundColor = .red
        btn2.tag = 102
        btn2.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        view.addSubview(btn2)
        
        let btn3 = UIButton.init(frame: CGRect.init(x: 0, y: 370, width: view.bounds.width, height: 60))
        btn3.backgroundColor = .red
        btn3.tag = 103
        btn3.addTarget(self, action: #selector(btnClicked(btn:)), for: .touchUpInside)
        view.addSubview(btn3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func btnClicked(btn: UIButton) {
        switch btn.tag - 100 {
        case 0:
            FN.open(url: "xx://yy/goodDetail?goodId=123")
        case 1:
            FN.open(url: "xx://yy/shopDetail?shopId=456", modal:true)
        case 2:
            FN.open(url: "xx://yy/login")
        case 3:
            FN.open(url: "http://www.weidian.com")
        default:
            break
        }
    }
}

