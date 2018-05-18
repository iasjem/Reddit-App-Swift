//
//  RedditData.swift
//  Contains functions to get information and JSON data needed from API
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit

struct jsonData {
     var myDate = MyDate()
    var subreddit: String = ""
    var id: String = ""
    var author: String = ""
    var title: String = ""
    var createdUTC: String = ""
    var selfText: String = ""
    var imageUrl: String = ""

    init(_ moreData: [String:AnyObject]) {
        self.subreddit = getSubReddit(moreData)
        self.id = getId(moreData)
        self.author = getAuthor(moreData)
        self.title = getTitle(moreData)
        self.createdUTC = getCreatedUTC(moreData)
        self.selfText = getSelfText(moreData)
        self.imageUrl = getImage(moreData)
    }
    
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
 
    func getRandomIndex(_ count: Int) -> Int {
        return Int(arc4random_uniform(UInt32(count)))
    } // for randomnizations
    
}

final class JSONDataStore {
    static let sharedInstance = JSONDataStore()
    private init() {}
    
    var myList = [jsonData]()
   
    func getJSONData(_ parsedResult: [String:AnyObject]) {
        // retrieve the data now
        if let data = parsedResult[Constants.ResponseKeys.Data] as? [String:AnyObject], let children = data[Constants.ResponseKeys.Children] as? [[String:AnyObject]]  {
            
            let randomIndex = Int(arc4random_uniform(UInt32(children.count)))
            let findChildren = children[randomIndex] as [String:AnyObject]
            
            if let moreData = findChildren[Constants.ResponseKeys.Data] as? [String:AnyObject] {
                
               myList.append(jsonData(moreData))

            }
        }
    }
    
    func connectToAPI () { // connect to API
        
        let url = URL(string: "\(Constants.Source.APIBaseURL)\(Constants.ParameterValues.SubReddit)")!
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // check for errors on connection to API
            func displayError(_ error: String) { print(error) }
            
            guard (error == nil) else {
                displayError("URL at time of error: \(url)")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                displayError("Your request returned a status code other than 2xx!")
                return
            }
            
            guard let data = data else {
                displayError("No data was returned by the request!")
                return
            }
            
            let parsedResult: [String:AnyObject]!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
            } catch {
                displayError("Could not parse the data as JSON: '\(data)'")
                return
            }
            
             self.getJSONData(parsedResult)    
            
        }
        
        task.resume()
               
    }
    
}
