//
//  SubscribeData.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 06/06/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import IGListKit


    class SubscribeData {
        
        let id: String
        let subRedditDataOne: SubRedditData
        let subRedditDataTwo: SubRedditData
        let subRedditDataThree: SubRedditData
        
        
        init(_ subRedditDataOne: SubRedditData, _ subRedditDataTwo: SubRedditData, _ subRedditDataThree: SubRedditData) {
            self.id = UUID().uuidString
            self.subRedditDataOne = subRedditDataOne
            self.subRedditDataTwo = subRedditDataTwo
            self.subRedditDataThree = subRedditDataThree
        }
        
    }


/** MARK: equatable SubscribeData **/
    extension SubscribeData: Equatable {
        
        static public func ==(rhs: SubscribeData, lhs: SubscribeData) -> Bool {
            return rhs.id == lhs.id
        }
        
    }

/** MARK: diff SubRedditData ListDiffable **/
    extension SubscribeData: ListDiffable {
        
        func diffIdentifier() -> NSObjectProtocol {
            return id as NSObjectProtocol
        }
        
        
        func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
            guard let object = object as? SubscribeData else {
                return false
            }
            return self.id == object.id
        }
        
    }
