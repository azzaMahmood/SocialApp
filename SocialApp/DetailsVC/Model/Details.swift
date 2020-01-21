//
//  Details.swift
//  SocialApp
//
//  Created by zoza on 22/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation
import ObjectMapper

struct Details: Mappable {
    var postId : Int?
    var id : Int?
    var name : String?
    var email : String?
    var body : String?
    
    init(){}
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        postId <- map["postId"]
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        body <- map["body"]
    }
    
}
