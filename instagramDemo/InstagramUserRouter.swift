//
//  InstagramRouter.swift
//  instagramDemo
//
//  Created by hongjian lin on 5/13/17.
//  Copyright © 2017 com.hongjian. All rights reserved.
//

import Alamofire

public enum InstagramUserRouter: URLRequestConvertible {
    case getUserFeedList(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .getUserFeedList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getUserFeedList:
            return "/users/self/media/recent/"
        }
    }
    
    // MARK: URLRequestConvertible
    
    public func asURLRequest() throws -> URLRequest {
        let url: NSURL!  = NSURL.init(string:DefaultSettings.sharedInstance.baseUrl)
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path)!)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getUserFeedList(let parameters):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
    
    
    
    
}
