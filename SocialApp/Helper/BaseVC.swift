//
//  BaseVC.swift
//  SocialApp
//
//  Created by zoza on 20/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setSemantic(view: view, languageKey: LanguageHelper.getCurrentLanguage())
    }
    

    

}
