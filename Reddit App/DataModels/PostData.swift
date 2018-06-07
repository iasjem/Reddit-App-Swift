//
//  PostData.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import IGListKit


/** MARK: model PostData Model **/
    class PostData {
        
        let id: String
        let subreddit: String
        let author: String
        let title: String
        let createdUTC: String
        let selfText: String
        let imageURL: String
        let imageWidth: Int
        
        
        init(_ id: String, _ subreddit: String, _ author: String, _ title: String, _ createdUTC: String, _ selfText: String, _ imageURL: String, _ imageWidth: Int) {
            self.id = id
            self.subreddit = subreddit
            self.author = author
            self.title = title
            self.createdUTC = createdUTC
            self.selfText = selfText
            self.imageURL = imageURL
            self.imageWidth = imageWidth
        } 
        
    }

/** MARK: equatable PostData **/
    extension PostData: Equatable {
        
        static public func ==(rhs: PostData, lhs: PostData) -> Bool {
            return rhs.id == lhs.id
        }
        
    }

/** MARK: ListDiffable PostData **/
    extension PostData: ListDiffable {
        
        public func diffIdentifier() -> NSObjectProtocol {
            return id as NSObjectProtocol
        }
    
        func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
            guard let object = object as? PostData else {
                return false
            }
            return self.id == object.id
        }
        
    }
