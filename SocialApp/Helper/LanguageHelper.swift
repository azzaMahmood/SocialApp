//
//  LanguageHelper.swift
//  SocialApp
//
//  Created by zoza on 20/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit

class LanguageHelper{
    
    static var currentLanguage = getlocal()
    
    static func getlocal() -> String{
        let prefferedLanguage = Locale.preferredLanguages[0] as String
        let arr = prefferedLanguage.components(separatedBy: "-")
        let deviceLanguage = arr.first
        return deviceLanguage!
    }
    
    static func setCurrentLanguage(langugaeCode: String) {
        currentLanguage = langugaeCode
        let defaults = UserDefaults.standard
        defaults.setValue(langugaeCode, forKey: "language")
        defaults.synchronize()
    }
    
    static func getCurrentLanguage() -> String {
        return currentLanguage
    }
    
    static func getStrings(forKey key: String) -> String{
        switch currentLanguage {
        case "en":
            return EnglishStrings.EnglishStringsDictionary[key]!
        case "ar":
            return ArabicStrings.ArabicStringsDictionary[key]!
        default:
            return ArabicStrings.ArabicStringsDictionary[key]!
        }
    }
}


extension UILabel{
    
    
    // localized label text
    @IBInspectable var lText: String {
        get {
            return self.lText
        }
        set {
            text = LanguageHelper.getStrings(forKey: newValue)
        }
    }
}


extension UIButton{
    
    // set button text from localized strings
    @objc func setText(forKey key: String){
        self.setTitle(LanguageHelper.getStrings(forKey: key), for: .normal)
    }
    
    
    // localized button text
    @IBInspectable var lText: String {
        get {
            return self.lText
        }
        set {
            setTitle(LanguageHelper.getStrings(forKey: newValue), for: .normal)
        }
    }
    @IBInspectable var lImage: String {
        get {
            return self.lImage
        }
        set {
            self.setImage(UIImage(named: LanguageHelper.getStrings(forKey: newValue)), for: .normal)
        }
    }
}

extension UIImageView{
    
    // set image text from localized strings
    @objc func setImage(forKey key: String){
        self.image = UIImage(named: LanguageHelper.getStrings(forKey: key))
    }
}



extension UIBarButtonItem{
    
    // set button text from localized strings
    @objc func setImage(forKey key: String){
        self.image = UIImage(named: LanguageHelper.getStrings(forKey: key))
    }
    
    
    // localized title
    @IBInspectable var lTitle: String {
        get {
            return self.lTitle
        }
        set {
            title = LanguageHelper.getStrings(forKey: newValue)
        }
    }
    
    
    // localized image
    @IBInspectable var lImage: String {
        get {
            return self.lImage
        }
        set {
            image = UIImage(named: LanguageHelper.getStrings(forKey: newValue))
        }
    }
}


extension UIViewController{
    
    // set view controller semantic using language key
    @objc func setSemantic(view: UIView, languageKey: String){
        
        for case let view  in view.subviews{
            if view is UITextView {
                let textView = view as! UITextView
                if languageKey == "ar"{
                    textView.textAlignment = .right
                }
                else{
                    textView.textAlignment = .left
                }
            }
            
        }
        if languageKey == "ar"{
            view.semanticContentAttribute = .forceRightToLeft
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        else{
            view.semanticContentAttribute = .forceLeftToRight
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
    }
    
  
   
    // show localized alert
    @objc func showLocalizedAlert(style: UIAlertController.Style, title: String, message: String, buttonTitle: String){
        let alert = UIAlertController(title: LanguageHelper.getStrings(forKey: title), message: LanguageHelper.getStrings(forKey: message), preferredStyle: style)
        let action = UIAlertAction(title: LanguageHelper.getStrings(forKey: buttonTitle), style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension UITextField{
    
    // set attributed text for text field from a language key
    @objc func setAttributedPlaceholder(forKey key: String, withColor color: UIColor){
        self.attributedPlaceholder = NSAttributedString(string:LanguageHelper.getStrings(forKey: key),attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    
    // localized place holder
    @IBInspectable var lPlaceholder: String {
        get {
            return self.lPlaceholder
        }
        set {
            switch LanguageHelper.getCurrentLanguage() {
            case "ar":
                if self.textAlignment != .center{
                    self.textAlignment = .right
                }
            case "en":
                if self.textAlignment != .center{
                    self.textAlignment = .left
                }
                
            default:
                break
            }
            placeholder = LanguageHelper.getStrings(forKey: newValue)
            
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder!  : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
            
        }
    }
    @IBInspectable var lImage: String {
        get {
            return self.lImage
        }
        set {
            self.background = UIImage(named: LanguageHelper.getStrings(forKey: newValue))
        }
    }
    
}


extension UIImageView{
    
    // localized image
    @IBInspectable var lImage: String {
        get {
            return self.lImage
        }
        set {
            image = UIImage(named: LanguageHelper.getStrings(forKey: newValue))
        }
    }
}

