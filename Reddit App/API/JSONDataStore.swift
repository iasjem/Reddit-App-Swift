//
//  DataFromAPI.swift
//  Contains functions to get information and JSON data needed from API
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


protocol RefreshDelegate: class {
    func reloadView()
    func isFinishedLoading(_ isFinish: Bool)
}

final class JSONDataStore  { // data storage parsed from JSON file
    
    static let sharedInstance = JSONDataStore()
    private init() {}  // applying sharing of instance
    
    weak var refreshMe: RefreshDelegate? // delegate for reloading collection view
    weak var finishMe: RefreshDelegate? // delegate for finishing loading all data fetched from JSON files
    
    var myPostList = [PostData]()
    var mySubRedditList = [SubRedditData]()
    
    
    func connectToAPI (_ subreddit: String, _ shouldTableEmpty: Bool) { // connect to API
        
        if shouldTableEmpty { // deinitialize all arrays of JSON Data
            myPostList = []
            mySubRedditList = []
        }
        
        var url = URL(string: "\(JSONConstants.Source.APIBaseURL)\(subreddit)")!
        var forWhatCell = "PostCells"
        getJSONData(url, forWhatCell, false) // loading data...
        
        url = URL(string: "\(JSONConstants.Source.APIBaseURL)")!
        forWhatCell = "SubscribeCell"
        getJSONData(url, forWhatCell, true) // finished loading!
        
    }
    
    
    func getJSONData (_ url: URL, _ forWhatCell: String, _ done: Bool) { // fetch data from JSON files
        
        var i = 0
        
        Alamofire.request(url, method: .get).validate().responseJSON {  response in
            switch response.result {
                case .success(let value): // if url response is successful
                    
                    let json = JSON(value)
                    
                    let countChildren = json[JSONConstants.ResponseKeys.Data][JSONConstants.ResponseKeys.Children].count
                    
                    while i < countChildren { // get more data from children of data
                        let findChildren = json[JSONConstants.ResponseKeys.Data][JSONConstants.ResponseKeys.Children][i]
                        
                        if let moreData = findChildren[JSONConstants.ResponseKeys.Data].dictionaryObject {
                            if forWhatCell == "PostCells" {
                                self.myPostList.append(PostData(moreData as [String : AnyObject]))
                            } else {
                                self.mySubRedditList.append(SubRedditData(moreData as [String : AnyObject]))
                            }
                        }
                        
                        i = i + 1
                        
                    }
                
                case .failure(let error):
                    print(error) // if url response failed
            }
            
            self.finishMe?.isFinishedLoading(done) // indicate if arrays are all loaded first before showing all cells
            self.refreshMe?.reloadView() // reload collection view after fetching data
            
        }
    }
    
}



