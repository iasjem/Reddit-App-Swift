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
    
    func getData() {
        let session = URLSession.shared
        let url = URL(string: "\(Constants.Source.APIBaseURL)\(Constants.ParameterValues.SubReddit)")!
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
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
            
            if let data = parsedResult[Constants.ResponseKeys.Data] as? [String:AnyObject], let children = data[Constants.ResponseKeys.Children] as? [[String:AnyObject]]  {
                
                self.randomIndex = Int(arc4random_uniform(UInt32(children.count)))
                let findChildren = children[self.randomIndex] as [String:AnyObject]
                
                if let moreData = findChildren[Constants.ResponseKeys.Data] as? [String:AnyObject] {
                    self.getTitle(moreData)
                    self.getAuthor(moreData)
                    self.getImage(moreData)
                    self.getSelfText(moreData)
                    self.getCreatedUTC(moreData)
                    
                }
            }
        }
        
        task.resume()
    }
    
    func getTitle(_ moreData: [String:AnyObject]) {
        guard let title = moreData[Constants.ResponseKeys.Title]  as? String else {
            print("No title")
            return
        }
        print(title)
    }
 
    func getAuthor(_ moreData: [String:AnyObject]) {
        guard let author = moreData[Constants.ResponseKeys.Author]  as? String else {
            print("Unknown")
            return
        }
        print(author)
    }
    
    func getCreatedUTC(_ moreData: [String:AnyObject]) {
        guard let createdUTC = moreData[Constants.ResponseKeys.CreatedUTC]  as? Int else {
            print("--")
            return
        }
        print(createdUTC)
    }
    
    func getSelfText(_ moreData: [String:AnyObject]) {
        guard let selfText = moreData[Constants.ResponseKeys.SelfText]  as? String else {
            print("No Self Text")
            return
        }
        print(selfText)
    }
    
    func getImage(_ moreData: [String:AnyObject]) {
        guard let preview = moreData[Constants.ResponseKeys.Preview]  as? [String:AnyObject], let images = preview[Constants.ResponseKeys.Images] as? [[String:AnyObject]] else {
            return
        }
        randomIndex = Int(arc4random_uniform(UInt32(images.count)))
        let findSource =  images[randomIndex] as [String:AnyObject]

        if let source = findSource[Constants.ResponseKeys.Source] as? [String:AnyObject]  {
            if let url = source[Constants.ResponseKeys.URL] {
                print(url)
            }
        }
    }
}
