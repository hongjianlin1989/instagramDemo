//
//  DownloadImage+UIImageView.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/14/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImageUsingCacheWithUrl(urlString: String) {
        self.image = nil
        
        // check for cache
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        // download image from url
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                imageCache.setObject(image!, forKey: urlString as AnyObject)
                self.image = image
            })
            
    
        }).resume()
    }
}
