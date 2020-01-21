//
//  ChangeLanguageVC.swift
//  SocialApp
//
//  Created by zoza on 20/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit

class ChangeLanguageVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func englishPrsd(_ sender: UIButton) {
        LanguageHelper.setCurrentLanguage(langugaeCode: "en")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PostsVC")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func arabicPrsd(_ sender: UIButton) {
        LanguageHelper.setCurrentLanguage(langugaeCode: "ar")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PostsVC")
        self.present(controller, animated: true, completion: nil)
    }
    
}
