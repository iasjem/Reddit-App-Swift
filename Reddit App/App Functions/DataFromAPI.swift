//
//  RedditData.swift
//  Contains functions to get information and JSON data needed from API
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


struct jsonData {
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
        guard let id = moreData[Constants.ResponseKeys.Id]  as? String else {
            return "Unknown"
        }
        return id
    } // get the id key and its value from JSON file
    
    func getSubReddit(_ moreData: [String:AnyObject]) -> String {
        guard let subreddit = moreData[Constants.ResponseKeys.SubReddit]  as? String else {
            return "Unknown"
        }
        return "r/\(subreddit)"
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
        return "u/\(author)"
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
    
    func getSelfText() -> String {
        return selfText
    } // get the selftext key and its value from JSON file
    
    func getImage(_ moreData: [String:AnyObject]) -> String {
        var getURL = ""
        guard let preview = moreData[Constants.ResponseKeys.Preview]  as? [String:AnyObject], let images = preview[Constants.ResponseKeys.Images] as? [[String:AnyObject]] else {
            return "Unknown"
        }
        let findSource =  images[0] as [String:AnyObject]
        
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
    } // for randomnization
    
    func getImageWidth(_ moreData: [String:AnyObject]) -> Int {
        var width = 0
        guard let preview = moreData[Constants.ResponseKeys.Preview]  as? [String:AnyObject], let images = preview[Constants.ResponseKeys.Images] as? [[String:AnyObject]] else {
            return 0
        }
        let findSource =  images[0] as [String:AnyObject]
        
        if let source = findSource[Constants.ResponseKeys.Source] as? [String:AnyObject]  {
            guard let imageWidth = source[Constants.ResponseKeys.imageWidth] as? Int else { 
                return 0
            }
            width = imageWidth
        }
        return width
    } // get the id key and its value from JSON file

}

final class JSONDataStore  {
    
    static let sharedInstance = JSONDataStore()
    private init() {}  // applying sharing of instance

    weak var refreshMe: refreshDelegate? // delegate for reloading collection view
    
    var myList = [jsonData]() 
    
    func connectToAPI () { // connect to API
        var i = 0
        let url = URL(string: "\(Constants.Source.APIBaseURL)\(Constants.ParameterValues.SubReddit)")!

        Alamofire.request(url, method: .get).validate().responseJSON {  response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let countChildren = json[Constants.ResponseKeys.Data][Constants.ResponseKeys.Children].count
                
                while i < countChildren {
                    let findChildren = json[Constants.ResponseKeys.Data][Constants.ResponseKeys.Children][i]
                    if let moreData = findChildren[Constants.ResponseKeys.Data].dictionaryObject {
                        self.myList.append(jsonData(moreData as [String : AnyObject]))
                        i = i + 1
                    }
                }
                self.refreshMe?.reloadView() // reload collection view after fetching data
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
}

protocol refreshDelegate: class { 
    func reloadView()
}




