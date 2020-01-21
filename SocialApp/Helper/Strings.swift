//
//  Strings.swift
//  SocialApp
//
//  Created by zoza on 20/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import Foundation

typealias keys = Keys
public struct Keys{
    
    static let  welcome = "welcome",
    socialApp = "socialApp",
    lang = "lang",
    posts = "posts",
    title = "title",
    description = "description",
    save = "save"
    
    
}



struct EnglishStrings {
    
    static let EnglishStringsDictionary = [
        Keys.welcome : "Welcome to",
        Keys.socialApp : "Social App",
        Keys.lang : "Languge",
        Keys.posts : "Posts"
      
    ]
}
struct ArabicStrings {
    
    static let ArabicStringsDictionary = [
        Keys.welcome : "مرحبا في",
        Keys.socialApp : "الابليكيشن",
        Keys.lang : "اللغة",
        Keys.posts : "المنشورات"
        
    ]
}




