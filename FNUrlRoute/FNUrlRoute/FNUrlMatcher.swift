//
//  FNUrlMatcher.swift
//  FNUrlRoute
//
//  Created by Fnoz on 2016/10/31.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNUrlMatcher {
    static let shared = FNUrlMatcher()
    var urlDictionary: Dictionary<String, AnyClass> = [:]

    class func fetchModuleClass(key: String) -> AnyClass? {
        return FNUrlMatcher.shared.urlDictionary[key]
    }
}
