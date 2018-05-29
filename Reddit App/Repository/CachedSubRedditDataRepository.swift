//
//  CachedSubRedditDataRepository.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 29/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit

class CachedSubRedditDataRepository: SubRedditDataRepository, CachedSubRedditData {
    
    var cachedSubRedditData: [SubRedditData] = []
    
    func getAllSubRedditData() -> [SubRedditData] {
        return cachedSubRedditData
    }

    
    func clearAllSubRedditData () {
        cachedSubRedditData = []
    }
    
}
