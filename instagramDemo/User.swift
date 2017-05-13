//
//  User.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit

class User: NSObject {
    public var dic:NSDictionary?
    init(objDictionary:NSDictionary) {
        dic = objDictionary
    }
    
    
    public var profilePicture: String? {
        return dic?["profile_picture"] as? String
    }
    
    
    public var fullName: String? {
        return dic?["full_name"] as? String
    }
    
}
