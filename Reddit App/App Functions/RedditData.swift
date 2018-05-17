//
//  RedditData.swift
//  Contains functions to get information and JSON data needed from API
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

struct jsonData: Equatable {
    
    var subreddit: String = ""
    var id: String = ""
    var author: String = ""
    var title: String = ""
    var createdUTC: String = ""
    var selfText: String?
    var imageUrl: String?
    
    init (_ subreddit: String, _ id: String, _ author: String, _ title: String, _ createdUTC: String, _ selfText: String, _ imageUrl: String) {
        self.subreddit = subreddit
        self.id = id
        self.author = author
        self.title = title
        self.createdUTC = createdUTC
        self.selfText = selfText
        self.imageUrl = imageUrl
    }
    
    static func == (lhs: jsonData, rhs: jsonData) -> Bool { // for comparing of jsonData types
        return lhs.id == rhs.id
    }
}

class RedditData {

    var myList = [jsonData]()
    var myDate = MyDate()
    
    func addJSONData (_ subreddit: String, _ id: String, _ author: String, _ title: String, _ createdUTC: String, _ selfText: String, _ imageUrl: String) {
        myList.append(jsonData(subreddit, id, author, title, createdUTC, selfText, imageUrl))
    } // add the collected JSON data to an array of structs
    
    func displayJSONData () { // for test purposes only
        for x in myList {
            print(x)
        }
    } // // show the collected JSON data from an array of structs
    
    func getRandomIndex(_ count: Int) -> Int {
        return Int(arc4random_uniform(UInt32(count)))
    } // for randomnizations
    
    func getChildrenCount(_ children: [[String:AnyObject]]) -> Int {
        return children.count
    } // get count of posts in current subreddit

    func getId(_ moreData: [String:AnyObject]) -> String {
        guard let id = moreData[Constants.ResponseKeys.Id]  as? String else {
            return "Unknown"
        }
        return id
    } // get the id key and its value from JSON file
    
    func getSubReddit(_ moreData: [String:AnyObject]) -> String {
        guard let subreddit = moreData[Constants.ResponseKeys.SubReddit]  as? String else {
            return "Unknown"
        }
        return subreddit
    } // get the subreddit key and its value from JSON file
    
    func getTitle(_ moreData: [String:AnyObject]) -> String {
        guard let title = moreData[Constants.ResponseKeys.Title]  as? String else {
           return "Unknown"
        }
        return title
    } // get the title key and its value from JSON file
 
    func getAuthor(_ moreData: [String:AnyObject]) -> String {
        guard let author = moreData[Constants.ResponseKeys.Author]  as? String else {
            return "Unknown"
        }
        return author
    } // get the author key and its value from JSON file
    
    func getCreatedUTC(_ moreData: [String:AnyObject]) -> String {
        guard let createdUTC = moreData[Constants.ResponseKeys.CreatedUTC]  as? Int else {
           return "--"
        }
        return "\(myDate.convertDate(Double(myDate.compareDateByHour(myDate.unixToDate(Double(createdUTC)), myDate.today))))"
    } // get the createdUTC key and its value from JSON file
    
    func getSelfText(_ moreData: [String:AnyObject]) -> String {
        guard let selfText = moreData[Constants.ResponseKeys.SelfText]  as? String else {
           return "Unknown"
        }
       return selfText
    } // get the selftext key and its value from JSON file
    
    func getImage(_ moreData: [String:AnyObject]) -> String {
        var getURL = ""
        guard let preview = moreData[Constants.ResponseKeys.Preview]  as? [String:AnyObject], let images = preview[Constants.ResponseKeys.Images] as? [[String:AnyObject]] else {
           return "Unknown"
        }
        let randomIndex = getRandomIndex(images.count)
        let findSource =  images[randomIndex] as [String:AnyObject]
        
        if let source = findSource[Constants.ResponseKeys.Source] as? [String:AnyObject]  {
            guard let url = source[Constants.ResponseKeys.URL] as? String else {
                return "Unknown"
            }
           getURL = url
        }
         return getURL
    } // get the post image url key and its value from JSON file
    
}
