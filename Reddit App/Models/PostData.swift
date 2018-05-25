//
//  PostData.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

struct PostData { 
    
    var myDate = MyDate()
    var subreddit: String = ""
    var id: String = ""
    var author: String = ""
    var title: String = ""
    var createdUTC: String = ""
    var selfText: String = ""
    var imageUrl: String = ""
    var imageWidth: Int = 0
    
    init(_ moreData: [String:AnyObject]) {
        self.subreddit = getSubReddit(moreData)
        self.id = getId(moreData)
        self.author = getAuthor(moreData)
        self.title = getTitle(moreData)
        self.createdUTC = getCreatedUTC(moreData)
        self.selfText = getSelfText(moreData)
        self.imageUrl = getImage(moreData)
        self.imageWidth = getImageWidth(moreData)
    }
    
    
    func getId(_ moreData: [String:AnyObject]) -> String {
        guard let id = moreData[JSONConstants.ResponseKeys.Id]  as? String else {
            return "Unknown"
        }
        return id
    }
    
    
    func getSubReddit(_ moreData: [String:AnyObject]) -> String {
        guard let subreddit = moreData[JSONConstants.ResponseKeys.SubReddit] as? String else {
            return "Unknown"
        }
        return "r/\(subreddit)"
    }
    
    
    func getTitle(_ moreData: [String:AnyObject]) -> String {
        guard let title = moreData[JSONConstants.ResponseKeys.Title]  as? String else {
            return "Unknown"
        }
        return title
    }
    
    
    func getAuthor(_ moreData: [String:AnyObject]) -> String {
        guard let author = moreData[JSONConstants.ResponseKeys.Author]  as? String else {
            return "Unknown"
        }
        return "u/\(author)"
    }
    
    
    func getCreatedUTC(_ moreData: [String:AnyObject]) -> String {
        guard let createdUTC = moreData[JSONConstants.ResponseKeys.CreatedUTC]  as? Int else {
            return "--"
        }
        return "\(myDate.convertDate(Double(myDate.compareDateByHour(myDate.unixToDate(Double(createdUTC)), myDate.today))))"
    }
    
    
    func getSelfText(_ moreData: [String:AnyObject]) -> String {
        guard let selfText = moreData[JSONConstants.ResponseKeys.SelfText]  as? String else {
            return "Unknown"
        }
        return selfText
    }
    
    
    func getImage(_ moreData: [String:AnyObject]) -> String {
        var getURL = ""
        guard let preview = moreData[JSONConstants.ResponseKeys.Preview]  as? [String:AnyObject], let images = preview[JSONConstants.ResponseKeys.Images] as? [[String:AnyObject]] else {
            return "Unknown"
        }
        let findSource =  images[0] as [String:AnyObject]
        
        if let source = findSource[JSONConstants.ResponseKeys.Source] as? [String:AnyObject]  {
            guard let url = source[JSONConstants.ResponseKeys.URL] as? String else {
                return "Unknown"
            }
            getURL = url
        }
        return getURL
    }
    
    
    func getImageWidth(_ moreData: [String:AnyObject]) -> Int {
        var width = 0
        guard let preview = moreData[JSONConstants.ResponseKeys.Preview]  as? [String:AnyObject], let images = preview[JSONConstants.ResponseKeys.Images] as? [[String:AnyObject]] else {
            return 0
        }
        let findSource =  images[0] as [String:AnyObject]
        
        if let source = findSource[JSONConstants.ResponseKeys.Source] as? [String:AnyObject]  {
            guard let imageWidth = source[JSONConstants.ResponseKeys.imageWidth] as? Int else {
                return 0
            }
            width = imageWidth
        }
        return width
    } 
    
    
}
