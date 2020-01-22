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
    save = "save",
    delete = "delete",
    update = "update"
    
    
}



struct EnglishStrings {
    
    static let EnglishStringsDictionary = [
        Keys.welcome : "Welcome to",
        Keys.socialApp : "Social App",
        Keys.lang : "Languge",
        Keys.posts : "Posts",
        Keys.title : "Title",
        Keys.description : "Description",
        Keys.save : "Save",
        Keys.delete : "Delete",
        Keys.update : "Update"
      
    ]
}
struct ArabicStrings {
    
    static let ArabicStringsDictionary = [
        Keys.welcome : "مرحبا في",
        Keys.socialApp : "الابليكيشن",
        Keys.lang : "اللغة",
        Keys.posts : "المنشورات",
        Keys.title : "عنوان",
        Keys.description : "وصف",
        Keys.save : "حفظ",
        Keys.delete : "مسح",
        Keys.update : "تعديل"
        
    ]
}




