//
//  PostCell.swift
//  SocialApp
//
//  Created by zoza on 20/01/2020.
//  Copyright © 2020 Azza. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postId: UILabel!    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postBody: UILabel!
    
    func configureCellDescription(id: Int, title: String, body: String) {
        self.postId.text = String(describing: id)
        self.postTitle.text = title
        self.postBody.text = body
    }
}
