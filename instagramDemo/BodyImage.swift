//
//  bodyImage.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit

class BodyImage: NSObject {
    public var dic:NSDictionary?
    init(objDictionary:NSDictionary) {
        dic = objDictionary
    }
    
    public var standardResolutionPNG: String? {
        let standardResolutionDic = dic?.object(forKey: "standard_resolution") as! NSDictionary
        return standardResolutionDic["url"] as? String
    }

}
