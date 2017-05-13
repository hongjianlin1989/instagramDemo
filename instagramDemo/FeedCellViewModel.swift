//
//  FeedCellViewModel.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit

class FeedCellViewModel: NSObject {
    let feed: Feed?
    
    init(inputFeed:Feed) {
        feed = inputFeed
    }
    
    public var userName: String? {
        return feed?.userName
    }
    
    public var bodyDescription: String? {
        return feed?.feedDescription
    }

    public var timeCreated: String? {
        return feed?.time
    }
    
    
    
    
    
}
