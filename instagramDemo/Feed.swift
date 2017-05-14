//
//  Feed.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit
import Foundation


class Feed: NSObject {

    public var dic:NSDictionary?
    public var user:User?
    public var bodyImage:BodyImage?
    init(objDictionary:NSDictionary) {
        dic = objDictionary
        user = User.init(objDictionary: dic?.object(forKey: "user") as! NSDictionary)
        bodyImage = BodyImage.init(objDictionary: dic?.object(forKey: "images") as! NSDictionary)
    }
    
    public var userName: String? {
        return user?.fullName
    }
    
    public var time: String? {
        return dic?["created_time"] as? String
    }
    
    public var feedDescription: String? {
        let captionDic = dic?.object(forKey: "caption") as! NSDictionary
        return captionDic["text"] as? String
    }
    
    public var bodyPNG: String? {
        let bodyPNGDic = dic?.object(forKey: "images") as! NSDictionary
        let standardResolution = bodyPNGDic.object(forKey: "standard_resolution") as! NSDictionary
        return standardResolution["url"] as? String
    }
    


    
}



