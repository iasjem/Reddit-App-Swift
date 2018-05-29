//
//  PostData.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

struct PostData { 
    
    let subreddit: String
    let author: String
    let title: String
    let createdUTC: String
    let selfText: String
    let imageURL: String
    let imageWidth: Int
    
    init(_ subreddit: String, _ author: String, _ title: String, _ createdUTC: String, _ selfText: String, _ imageURL: String, _ imageWidth: Int) {
        self.subreddit = subreddit
        self.author = author
        self.title = title
        self.createdUTC = createdUTC
        self.selfText = selfText
        self.imageURL = imageURL
        self.imageWidth = imageWidth
    } 
    
}
