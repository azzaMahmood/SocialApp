//
//  PostsVC.swift
//  SocialApp
//
//  Created by zoza on 19/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit

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
    
    //    MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.delegate = self
        postsTableView.dataSource = self
        self.presenter = PostsListPresenter(view: self)
        self.presenter.getPostsData()
        postsTableView.reloadData()
        
    }
    //    MARK:- Method
    
    
    
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
    
   
    
}

