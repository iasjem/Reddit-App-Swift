//
//  API.swift
//  Related to APIs
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

//func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
//    DispatchQueue.main.async {
//        updates()
//    }
//}

struct Constants {
    struct Source {
        static let APIBaseURL = "https://api.reddit.com/r/"
    }
    
    struct ParameterKeys {
        static let SubReddit = "subreddit"
        static let Format = "format"
        static let FilterType = "filter_type"
    }
    
    struct ParameterValues {
        static let SubReddit = "iOSProgramming"
        static let Format = ".json"
        static let FilterType = ""
    }
    
    struct ResponseKeys {
        static let Children = "children"
        static let Data = "data"
        static let Status = "stat"
        static let SubReddit = "subreddit"
        static let Title = "title"
        static let Author = "author"
        static let SelfText = "selftext"
        static let Preview = "preview"
        static let Images = "images"
        static let Source = "source"
        static let Id = "id" 
        static let URL = "url"
        static let CreatedUTC = "created_utc"
    }
    
    struct ResponseValues {
        static let OKStatus = "ok"
    }
}

class API {
    
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
            //            // retrieve the data now
            //                if let data = parsedResult[Constants.ResponseKeys.Data] as? [String:AnyObject], let children = data[Constants.ResponseKeys.Children] as? [[String:AnyObject]]  {
            //
            //                    print(children.count)
            //                    self.randomIndex = Int(arc4random_uniform(UInt32(children.count)))
            //                    let findChildren = children[self.randomIndex] as [String:AnyObject]
            //
            //                    if let moreData = findChildren[Constants.ResponseKeys.Data] as? [String:AnyObject] {
            //                        // get the data here
            //                        self.redditData.addJSONData(self.redditData.getSubReddit(moreData), self.redditData.getId(moreData), self.redditData.getAuthor(moreData), self.redditData.getTitle(moreData), self.redditData.getCreatedUTC(moreData), self.redditData.getSelfText(moreData), self.redditData.getImage(moreData))
            //
            //                        print(self.redditData.countJSONData())
            //
            //                    }
            //                }
            
        }
        
        task.resume()
        
    }
}
