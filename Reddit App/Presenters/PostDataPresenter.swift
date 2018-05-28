//
//  PostDataPresenter.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 28/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


protocol PostDataViewPresenter: class {
    init(view: PostDataView, postdata: PostData)
    func showYellowCell()
    func showBlueCell()
    func showImageCell()
}

class PostDataPresenter: PostDataViewPresenter {
    
    unowned let view: PostDataView
    let postdata: PostData
    
    required init(view: PostDataView, postdata: PostData) {
        self.view = view
        self.postdata = postdata
    }
    
    func showYellowCell() {
        let postTitle = self.postdata.title
        let postText = self.postdata.selfText
        let subReddit = self.postdata.subreddit
        let postAuthor = self.postdata.author
        let postTime = self.postdata.createdUTC
        let postImage = self.postdata.imageUrl
        
        self.view.setYellowCell(postTitle, postText, subReddit, postAuthor, postTime, postImage)
    }
    
    func showBlueCell() {
        let postTitle = self.postdata.title
        let subReddit = self.postdata.subreddit
        let postAuthor = self.postdata.author
        let postTime = self.postdata.createdUTC
        let postImage = self.postdata.imageUrl
        
        self.view.setBlueCell(postTitle, subReddit, postAuthor, postTime, postImage)
    }
    
    func showImageCell() {
        let postTitle = self.postdata.title
        let subReddit = self.postdata.subreddit
        let postAuthor = self.postdata.author
        let postTime = self.postdata.createdUTC
        let postImage = self.postdata.imageUrl
        
        self.view.setImageCell(postTitle, subReddit, postAuthor, postTime, postImage)
    }
    

}
