//
//  SubredditData.swift
//  Contains data from the subreddit JSON file
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

struct SubRedditData {
    
    var subscribers: Int = 0
    var displayName: String = ""
    var displayNamePrefixed: String = ""
    var publicDescription: String = ""
    var subRedditIcon: String = ""
    var bannerImage: String = ""
    
    init(_ moreData: [String:AnyObject]) {
        self.subscribers = getSubscribers(moreData)
        self.displayName = getDisplayName(moreData)
        self.publicDescription = getPublicDescription(moreData)
        self.subRedditIcon = getSubRedditIcon(moreData)
        self.bannerImage = getBannerImage(moreData)
        self.displayNamePrefixed = getDisplayNamePrefixed(moreData)
    }
    
    
    func getSubscribers(_ moreData: [String:AnyObject]) -> Int {
        
        guard let subscribers = moreData[JSONConstants.ResponseKeys.Subscribers]  as? Int else {
            return 0
        }
        return subscribers
    }
    
    
    func getDisplayName (_ moreData: [String:AnyObject]) -> String {
        guard let displayName = moreData[JSONConstants.ResponseKeys.DisplayName]  as? String else {
            return "Unknown"
        }
        return displayName
    }
    
    
    func getDisplayNamePrefixed (_ moreData: [String:AnyObject]) -> String {
        guard let displayNamePrefixed = moreData[JSONConstants.ResponseKeys.DisplayNamePrefixed]  as? String else {
            return "Unknown"
        }
        return displayNamePrefixed
    }
    
    
    func getPublicDescription (_ moreData: [String:AnyObject]) -> String {
        guard let publicDescription = moreData[JSONConstants.ResponseKeys.PublicDescription]  as? String else {
            return "Unknown"
        }
        return publicDescription
    }
    
    
    func getSubRedditIcon (_ moreData: [String:AnyObject]) -> String {
        guard let subRedditIcon = moreData[JSONConstants.ResponseKeys.SubRedditIcon]  as? String else {
            return "Unknown"
        }
        return subRedditIcon
    }
    
    
    func getBannerImage (_ moreData: [String:AnyObject]) -> String {
        guard let bannerImage = moreData[JSONConstants.ResponseKeys.BannerImage]  as? String else {
            return "Unknown"
        }
        return bannerImage
    }
    
}
