//
//  Feed.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

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
    
    public var userProfileImageUrl: URL? {
        return URL.init(string: (user?.profilePicture)!)
    }
    
    public var bodyPNG: String? {
        let captionDic = dic?.object(forKey: "caption") as! NSDictionary
        return captionDic["text"] as? String
    }
    


    
}



extension Feed{
    
    /**
     Fetches the feed from the network `GET /self/media/recent/`, then creates `feed` objects .
     
     */
    public static func getListOfFeed(params: [String: Any] , completion: ((_ array: Array<Feed> ,  _ error: Error?) -> Void)?) {
        
        Alamofire.request(InstagramRouter.getUserFeedList(parameters: params))
            .validate()
            .responseJSON { (response) in
                
                switch response.result {
                case .success(let value):
                    var feedArray : Array<Feed> = Array.init()
                    let JSON = value as? NSDictionary
                    if let JsonArray = JSON?.object(forKey: "data") as? NSArray{
                        
                        for case let item as NSDictionary in JsonArray {
                            let feed = Feed.init(objDictionary: item)
                            feedArray.append(feed)
                        }
                    }
            
                    completion!(feedArray,nil)
                    
                    
                case .failure(let error):
                    print("error: \(error)")
                    completion!([] ,error)
                }
        }
    }

    

}
