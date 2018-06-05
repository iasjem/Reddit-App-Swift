//
//  SubRedditDataRepository.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 29/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON


/** MARK: repository SubRedditData Repository **/
    class SubRedditDataRepository {
        
        private var subRedditData:[SubRedditData] = []
        private var errorMessage: String = ""
        
        
        func getAllSubRedditData(_ success: @escaping ([SubRedditData]) -> Void , _ fail: @escaping (String) -> Void) {

            var index = 0
            let url = URL(string: "\(JSONConstants.Source.APIBaseURL)")!
            
            Alamofire.request(url, method: .get).validate().responseJSON {  response in
                
                switch response.result {
                    
                case .success(let value): // if url response is successful
                    
                    let json = JSON(value)
                    
                    let countChildren = json[JSONConstants.ResponseKeys.Data][JSONConstants.ResponseKeys.Children].count
                    
                    while index < countChildren { // get more data from children of data
                        let findChildren = json[JSONConstants.ResponseKeys.Data][JSONConstants.ResponseKeys.Children][index]
                        
                        if let moreData = findChildren[JSONConstants.ResponseKeys.Data].dictionaryObject  {
                            
                            let id = self.getId(moreData as [String : AnyObject])
                            let subscribersCount = self.getSubscribers(moreData as [String : AnyObject])
                            let displayName = self.getDisplayName(moreData as [String : AnyObject])
                            let displayNamePrefixed = self.getDisplayNamePrefixed(moreData as [String : AnyObject])
                            let publicDescription = self.getPublicDescription(moreData as [String : AnyObject])
                            let subRedditIconURL = self.getSubRedditIcon(moreData as [String : AnyObject])
                            let bannerImageuRL = self.getBannerImage(moreData as [String : AnyObject])
                            
                            self.subRedditData.append(SubRedditData(id, subscribersCount, displayName, displayNamePrefixed, publicDescription, subRedditIconURL, bannerImageuRL))
                            
                        }
                        
                        index = index + 1
                        
                    }
                    
                    success(self.subRedditData)
                    
                case .failure(let error):
                    print(error) // if url response failed
                    self.errorMessage = "Failed to load data. Please try again."
                    fail(self.errorMessage)
                }
                
            }
            
        }
        
        
        func clearAllSubRedditData () {
            subRedditData = []
        }
        
        
    /** MARK: Conversions of JSON data from API **/
        private func getId(_ moreData: [String:AnyObject]) -> String {
            guard let Id = moreData[JSONConstants.ResponseKeys.Id] as? String else {
                return "Unknown"
            }
            return "r/\(Id)"
        }
        
        
        private func getSubscribers(_ moreData: [String:AnyObject]) -> Int {
            
            guard let subscribers = moreData[JSONConstants.ResponseKeys.Subscribers]  as? Int else {
                return 0
            }
            return subscribers
        }
        
        
        private func getDisplayName (_ moreData: [String:AnyObject]) -> String {
            guard let displayName = moreData[JSONConstants.ResponseKeys.DisplayName]  as? String else {
                return "Unknown"
            }
            return displayName
        }
        
        
        private func getDisplayNamePrefixed (_ moreData: [String:AnyObject]) -> String {
            guard let displayNamePrefixed = moreData[JSONConstants.ResponseKeys.DisplayNamePrefixed]  as? String else {
                return "Unknown"
            }
            return displayNamePrefixed
        }
        
        
        private func getPublicDescription (_ moreData: [String:AnyObject]) -> String {
            guard let publicDescription = moreData[JSONConstants.ResponseKeys.PublicDescription]  as? String else {
                return "Unknown"
            }
            return publicDescription
        }
        
        
        private func getSubRedditIcon (_ moreData: [String:AnyObject]) -> String {
            guard let subRedditIcon = moreData[JSONConstants.ResponseKeys.SubRedditIcon]  as? String else {
                return "Unknown"
            }
            return subRedditIcon
        }
        
        
        private func getBannerImage (_ moreData: [String:AnyObject]) -> String {
            guard let bannerImage = moreData[JSONConstants.ResponseKeys.BannerImage]  as? String else {
                return "Unknown"
            }
            return bannerImage
        }
        
    }


