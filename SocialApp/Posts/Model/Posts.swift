//
//  Posts.swift
//  SocialApp
//
//  Created by zoza on 20/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//


import Foundation
import ObjectMapper

struct Posts: Mappable {
    var userId : Int?
    var id : Int?
    var title : String?
    var body : String?
    
    init(){}
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        userId <- map["userId"]
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
    }
    
}
