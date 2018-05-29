//
//  SubRedditDataRepository.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 29/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


protocol SubRedditDataRepository {
    
    func getAllSubRedditData() -> [SubRedditData]
    func clearAllSubRedditData ()
    
}


protocol CachedSubRedditData {
    
    var cachedSubRedditData:[SubRedditData] { get set }
    
}
