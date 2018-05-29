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
    init(view: PostDataView, postdata: [PostData])
    func showViewCells(_ index: Int)
    
}

class PostDataPresenter: PostDataViewPresenter {
    
    unowned let view: PostDataView
    var postData: [PostData]
    
    required init(view: PostDataView, postdata: [PostData]) {
        self.view = view
        self.postData = postdata
    }
    
    func showViewCells(_ index: Int) {
        let dataManager = JSONDataManager()
        postData = dataManager.getPostData()
        let postTitle = self.postData[index].title
        let postText = self.postData[index].selfText
        let subReddit = self.postData[index].subreddit
        let postAuthor = self.postData[index].author
        let postTime = self.postData[index].createdUTC
        let postImage = self.postData[index].imageURL
        
        self.view.setYellowCell(postTitle, postText, subReddit, postAuthor, postTime, postImage)
        self.view.setBlueCell(postTitle, subReddit, postAuthor, postTime, postImage)
        self.view.setImageCell(postTitle, subReddit, postAuthor, postTime, postImage)
    }
    
    

}
