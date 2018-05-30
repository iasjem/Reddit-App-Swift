//
//  PostDataRepository.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 29/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


class PostDataRepository {
    
    var postData:[PostData] = []
    var errMessage: String = ""
    private var subreddit: String = "iOSProgramming"
    
    private var myDate = MyDate()
    
    
    func getAllPostData(_ success: @escaping ([PostData]) -> Void , _ fail: @escaping (String) -> Void) {
        
        var i = 0
        let url = URL(string: "\(JSONConstants.Source.APIBaseURL)\(subreddit)")!
        
        Alamofire.request(url, method: .get).validate().responseJSON {  response in
            switch response.result {
            case .success(let value): // if url response is successful
                
                let json = JSON(value)
                
                let countChildren = json[JSONConstants.ResponseKeys.Data][JSONConstants.ResponseKeys.Children].count
                
                while i < countChildren { // get more data from children of data
                    let findChildren = json[JSONConstants.ResponseKeys.Data][JSONConstants.ResponseKeys.Children][i]
                    
                    if let moreData = findChildren[JSONConstants.ResponseKeys.Data].dictionaryObject {
                        
                        let subReddit = self.getSubReddit(moreData as [String : AnyObject])
                        let title = self.getTitle(moreData as [String : AnyObject])
                        let author = self.getAuthor(moreData as [String : AnyObject])
                        let createdUTC = self.getCreatedUTC(moreData as [String : AnyObject])
                        let selfText = self.getSelfText(moreData as [String : AnyObject])
                        let imageURL = self.getImage(moreData as [String : AnyObject])
                        let imageWidth = self.getImageWidth(moreData as [String : AnyObject])
                        
                        self.postData.append(PostData(subReddit, author, title, createdUTC, selfText, imageURL, imageWidth))
                        
                    }
                    i = i + 1
                }
                success(self.postData)
                
            case .failure(let error):
                print(error) // if url response failed
                self.errMessage = "Failed to load data. Please try again."
                fail(self.errMessage)
            }
        }
    }
    
    
    func clearAllPostData () {
        postData = []
    }


    private func getSubReddit(_ moreData: [String:AnyObject]) -> String {
        guard let subreddit = moreData[JSONConstants.ResponseKeys.SubReddit] as? String else {
            return "Unknown"
        }
        return "r/\(subreddit)"
    }
    
    
    private func getTitle(_ moreData: [String:AnyObject]) -> String {
        guard let title = moreData[JSONConstants.ResponseKeys.Title]  as? String else {
            return "Unknown"
        }
        return title
    }
    
    
    private func getAuthor(_ moreData: [String:AnyObject]) -> String {
        guard let author = moreData[JSONConstants.ResponseKeys.Author]  as? String else {
            return "Unknown"
        }
        return "u/\(author)"
    }
    
    
    private func getCreatedUTC(_ moreData: [String:AnyObject]) -> String {
        guard let createdUTC = moreData[JSONConstants.ResponseKeys.CreatedUTC]  as? Int else {
            return "--"
        }
        return "\(myDate.convertDate(Double(myDate.compareDateByHour(myDate.unixToDate(Double(createdUTC)), myDate.today))))"
    }
    
    
    private func getSelfText(_ moreData: [String:AnyObject]) -> String {
        guard let selfText = moreData[JSONConstants.ResponseKeys.SelfText]  as? String else {
            return "Unknown"
        }
        return selfText
    }
    
    
    private func getImage(_ moreData: [String:AnyObject]) -> String {
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
    
    
    private func getImageWidth(_ moreData: [String:AnyObject]) -> Int {
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
