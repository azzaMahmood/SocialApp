//
//  Extentions.swift
//  SocialApp
//
//  Created by zoza on 20/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//


import UIKit
import Foundation

extension UIView{
    
    // corner radius
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    
    // border width
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    
    // border color
    @IBInspectable
    var borderColor: UIColor{
        get {
            return self.borderColor
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    
    // shadow
    @IBInspectable
    var shadowColor: UIColor{
        get {
            return self.shadowColor
        }
        set {
            self.layer.shadowColor = newValue.cgColor
            self.layer.shadowOffset = CGSize.zero
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 4
            self.layer.masksToBounds = false
        }
    }
    
    
    // add shadow to view
    @objc func addShadow(color: UIColor){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
    }
}


extension UIViewController: UIPopoverPresentationControllerDelegate{
    
    
    // show alert
    @objc func showAlertt(title: String, message: String, buttonTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(action)
        let window = UIApplication.shared.keyWindow
        let rootViewController = window?.rootViewController
        rootViewController!.present(alert, animated: true, completion: nil)
    }
    
    
  
    // push view controller
    @objc func pushVC(storyboard: String, viewController: String, animated: Bool){
        let storyboard: UIStoryboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: viewController) as UIViewController
        
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    
   
    
    // present view controller as popover
    @objc func presentPopover(popoverVC vc: UIViewController, sender: UIButton){
        vc.modalPresentationStyle = UIModalPresentationStyle.popover
        vc.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        vc.popoverPresentationController?.delegate = self
        vc.popoverPresentationController?.sourceView = sender
        vc.popoverPresentationController?.sourceRect = sender.bounds
        self.present(vc, animated: true, completion: nil)
    }
   
    // set view controller semantic using semantic value
    @objc func setSemantic(view: UIView, semantic: UISemanticContentAttribute){
        view.semanticContentAttribute = semantic        
        for case let textView as UITextView in view.subviews{
            if semantic == .forceRightToLeft{
                textView.textAlignment = .right
            }
            else{
                textView.textAlignment = .left
            }
        }
        
        for v in view.subviews{
            setSemantic(view: v, semantic: semantic)
        }
    }
    
}



extension CALayer {
    @objc var borderUIColor: UIColor {
        set {
            self.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: self.borderColor!)
        }
    }
}



extension UITableView{
    func animate() {
        self.reloadData()
        let cells = self.visibleCells
        let tableHeight: CGFloat = self.bounds.size.height
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        var index = 0
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1, delay:  0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .allowAnimatedContent, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            index += 1
        }
    }
}
