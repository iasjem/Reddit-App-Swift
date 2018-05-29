//
//  CachedPostDataRepository.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 29/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit

class CachedPostDataRepository: PostDataRepository, CachedPostData {
    
    var cachedPostData: [PostData] = []
    
    func getAllPostData() -> [PostData] {
        return cachedPostData
    }

    
    func clearAllPostData () {
        cachedPostData = []
    }
    
}


