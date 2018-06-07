//
//  SubredditData.swift
//  Contains data from the subreddit JSON file
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import IGListKit


/** MARK: model SubRedditData Model **/
    class SubRedditData {
        
        let id: String
        let subscribers: Int
        let displayName: String
        let displayNamePrefixed: String
        let publicDescription: String
        let subRedditIcon: String
        let bannerImage: String
        
        
        init(_ id: String, _ subscribers: Int, _ displayName: String, _ displayNamePrefixed: String, _ publicDescription: String, _ subRedditIcon: String, _ bannerImage: String) {
            self.id = id
            self.subscribers = subscribers
            self.displayName = displayName
            self.displayNamePrefixed = displayNamePrefixed
            self.publicDescription = publicDescription
            self.subRedditIcon = subRedditIcon
            self.bannerImage = bannerImage
        }
        
    }

/** MARK: equatable SubRedditData **/
    extension SubRedditData: Equatable {
        
        static public func ==(rhs: SubRedditData, lhs: SubRedditData) -> Bool {
            return rhs.id == lhs.id
        }
        
    }

/** MARK: ListDiffable SubRedditData **/
    extension SubRedditData: ListDiffable {
        
        func diffIdentifier() -> NSObjectProtocol {
            return id as NSObjectProtocol
        }
    
        func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
            guard let object = object as? SubRedditData else {
                return false
            }
            return self.id == object.id
        }
    
    }
