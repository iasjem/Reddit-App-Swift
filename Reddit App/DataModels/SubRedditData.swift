//
//  SubredditData.swift
//  Contains data from the subreddit JSON file
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation


/** MARK: model SubRedditData Model **/
    struct SubRedditData {
        
        let subscribers: Int
        let displayName: String
        let displayNamePrefixed: String
        let publicDescription: String
        let subRedditIcon: String
        let bannerImage: String
        
        
        init(_ subscribers: Int, _ displayName: String, _ displayNamePrefixed: String, _ publicDescription: String, _ subRedditIcon: String, _ bannerImage: String) {
            self.subscribers = subscribers
            self.displayName = displayName
            self.displayNamePrefixed = displayNamePrefixed
            self.publicDescription = publicDescription
            self.subRedditIcon = subRedditIcon
            self.bannerImage = bannerImage
        }
        
    }
