//
//  InstagramServce.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/14/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit
import Alamofire

class InstagramServce: NSObject {
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
