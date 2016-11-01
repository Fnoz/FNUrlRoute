//
//  ShopDetailViewController.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/11/1.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController, FNUrlRouteDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 20, width: 60, height: 44))
        btn.setTitle("返回", for: .normal)
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(btn)
        
        view.backgroundColor = .green
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(params: [String: AnyObject]?) {
        super.init(nibName: nil, bundle: nil)
        print(params)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func back() {
        dismiss(animated: true, completion: nil);
    }
}
