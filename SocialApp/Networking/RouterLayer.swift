//
//  RouterLayer.swift
//  SocialApp
//
//  Created by zoza on 20/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "https://jsonplaceholder.typicode.com/"
    
    case Comments(Int)
    case posts
    case create([String: Any])
    case delete(Int)
    
    func asURLRequest() throws -> URLRequest {
        var method: HTTPMethod {
            switch self {
            case .Comments,.posts:
                return .get
            case .create:
                return .post
            case .delete:
                return .delete
            }
        }
        
        let params: ([String: Any]?) = {
            switch self {
            case .Comments, .delete, .posts:
                return nil
            case .create(let newPost):
                return (newPost)
            }
        }()
        
        let url: URL = {
            // build up and return the URL for each endpoint
            let relativePath: String?
            switch self {
            case .Comments(let id):
                relativePath = "comments?postId=\(id)"
            case .create:
                relativePath = "posts"
            case .delete(let id):
                relativePath = "/posts/\(id)"
            case .posts:
                relativePath = "posts/"
            }
            
            var url = URL(string: Router.baseURLString)!
            if let relativePath = relativePath {
                url = url.appendingPathComponent(relativePath)
            }
            return url
        }()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: params)
    }
}
