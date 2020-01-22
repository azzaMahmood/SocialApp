//
//  PostsVC.swift
//  SocialApp
//
//  Created by zoza on 19/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit
import CoreData

protocol  PostListViewProtocol{
    func setPost(data:[Posts])
    func showAlert(title:String, message:String)
}


class PostsVC: BaseVC {

    //    MARK:- Outlet
    @IBOutlet weak var postsTableView: UITableView!
    
    //    MARK:- Properties
    var postsData = [Posts]()
    var postsCore = [Postz]()
    var online = false
    var cellId = "PostTableViewCell"
    var presenter : PostsListPresenterProtocol!
    var deletedPostId = 0
    var segueId = "editPost"
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    
    //    MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.delegate = self
        postsTableView.dataSource = self
        self.presenter = PostsListPresenter(view: self)
        self.presenter.getPostsData()
        postsTableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }
    //    MARK:- Method
   
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<Postz>(entityName: "Postz")
        
        do {
            postsCore = try managedContext.fetch(fetchRequest)
            print("Successfully fetched data.")
            completion(true)
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func animateTable() {
        postsTableView.reloadData()
        let cells = postsTableView.visibleCells
        let tableHeight: CGFloat = postsTableView.bounds.size.height
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
    
    
    //    MARK:- Action
    @IBAction func changeLanguagePrsd(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ChangeLanguageVC")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func addPostPrsd(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddAndEditPostVC")
        self.present(controller, animated: true, completion: nil)
    }
    
}

extension PostsVC: PostListViewProtocol{
    func setPost(data: [Posts]) {
        self.postsData = data
        online = true
        self.postsTableView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true) {
            self.postsTableView.reloadData()
        }
    }
}

extension PostsVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if online == true {
        return postsData.count
        }
        else {
            return postsCore.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        let title = postsData[indexPath.row].title ?? ""
        let id = postsData[indexPath.row].id ?? 0
        let body = postsData[indexPath.row].body ?? ""
        cell.configureCellDescription(id: id, title: title, body: body)
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: LanguageHelper.getStrings(forKey: Keys.delete) ) { (rowAction, indexPath) in
            if self.online == false {
            self.removePost(atIndexPath: indexPath)
              tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            else {
                return 
            }
        }
        
        let addAction = UITableViewRowAction(style: .normal, title: LanguageHelper.getStrings(forKey: Keys.update)) { (rowAction, indexPath) in
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddAndEditPostVC") as! AddAndEditPostVC
            
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.961445272, green: 0.650790751, blue: 0.1328578591, alpha: 1)
        
        return [deleteAction, addAction]
    }
}

extension PostsVC {
    func removePost(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(postsCore[indexPath.row])
        
        do {
            try managedContext.save()
            print("Successfully removed goal!")
        } catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
    }
    
    
}
    


