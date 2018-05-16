//
//  RedditData.swift
//  Reddit App
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

class RedditData {

    var randomIndex = 0
    var myDate = MyDate()

    func getTitle(_ moreData: [String:AnyObject]) -> String {
        guard let title = moreData[Constants.ResponseKeys.Title]  as? String else {
            print("No title")
           return "Unknown"
        }
        return title
    }
 
    func getAuthor(_ moreData: [String:AnyObject]) -> String {
        guard let author = moreData[Constants.ResponseKeys.Author]  as? String else {
            return "Unknown"
        }
        return author
    }
    
    func getCreatedUTC(_ moreData: [String:AnyObject]) -> String {
        guard let createdUTC = moreData[Constants.ResponseKeys.CreatedUTC]  as? Int else {
           return "--"
        }
        return "\(myDate.convertDate(Double(myDate.compareDateByHour(myDate.unixToDate(Double(createdUTC)), myDate.today))))"
    }
    
    func getSelfText(_ moreData: [String:AnyObject]) -> String {
        guard let selfText = moreData[Constants.ResponseKeys.SelfText]  as? String else {
           return "Unknown"
        }
       return selfText
    }
    
    func getImage(_ moreData: [String:AnyObject]) -> String {
        var getURL = ""
        guard let preview = moreData[Constants.ResponseKeys.Preview]  as? [String:AnyObject], let images = preview[Constants.ResponseKeys.Images] as? [[String:AnyObject]] else {
           return "Unknown"
        }
        randomIndex = Int(arc4random_uniform(UInt32(images.count)))
        let findSource =  images[randomIndex] as [String:AnyObject]
        
        if let source = findSource[Constants.ResponseKeys.Source] as? [String:AnyObject]  {
            guard let url = source[Constants.ResponseKeys.URL] as? String else {
                return "Unknown"
            }
           getURL = url
        }
         return getURL
    }
  }
