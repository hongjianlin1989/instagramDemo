//
//  FeedCellViewModel.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class FeedCellViewModel: NSObject {
    let feed: Feed!
    
    init(inputFeed:Feed) {
        feed = inputFeed
    }
    
    public var userName: String? {
        return feed.userName
    }
    
    public var bodyDescription: String? {
        return feed.feedDescription
    }

    public var timeCreated: String? {
        let date = NSDate(timeIntervalSince1970: Double(feed.time!)!)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date as Date)
    }
    
    public var userProfileImageUrl: URL? {
        return URL.init(string: (feed?.user?.profilePicture)!)
    }
    
    public var bodyImageUrl: URL? {
        return URL.init(string: (feed?.bodyPNG)!)
    }
    
    func downloadImages(imageUrl: URL , completion: ((_ image: UIImage ,  _ error: Error?) -> Void)?) {
        
        Alamofire.request(imageUrl).responseImage { response in
            debugPrint(response)
            debugPrint(response.result)
            
            switch response.result {
            case .success( _):
                var returnImage = UIImage.init()
                if let image = response.result.value {
                    returnImage = image
                    print("image downloaded: \(image)")
                }
                completion!(returnImage,nil)
                
                
            case .failure(let error):
                
                completion!(UIImage.init() ,error)
            }
            
        }
        
    }

}

