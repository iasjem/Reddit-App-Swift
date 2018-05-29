//
//  JSONDataManager.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 29/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

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

final class JSONDataManager { // data storage parsed from JSON file
    
    var cachedPostDataRepository: PostDataRepository&CachedPostData
    var remotePostDataRepository: PostDataRepository
    
    var cachedSubRedditDataRepository: SubRedditDataRepository&CachedSubRedditData
    var remoteSubRedditDataRepository: SubRedditDataRepository
    
    init() {
        self.cachedPostDataRepository = CachedPostDataRepository()
        self.cachedSubRedditDataRepository = CachedSubRedditDataRepository()
        self.remotePostDataRepository = RemotePostDataRepository()
        self.remoteSubRedditDataRepository = RemoteSubRedditDataRepository()
    }
    
    func reloadPostData()-> [PostData] {
        cachedPostDataRepository.clearAllPostData()
        cachedPostDataRepository.cachedPostData = remotePostDataRepository.getAllPostData()
        return cachedPostDataRepository.cachedPostData
    }
    
    func reloadSubRedditData() -> [SubRedditData] {
        cachedSubRedditDataRepository.clearAllSubRedditData()
        cachedSubRedditDataRepository.cachedSubRedditData = remoteSubRedditDataRepository.getAllSubRedditData()
        return cachedSubRedditDataRepository.cachedSubRedditData
    }
    
    func getPostData() -> [PostData] {
        if cachedPostDataRepository.cachedPostData.isEmpty {
            cachedPostDataRepository.cachedPostData = remotePostDataRepository.getAllPostData()
        }
        return cachedPostDataRepository.cachedPostData
    }
    
    func getSubRedditData() -> [SubRedditData] {
        if cachedSubRedditDataRepository.cachedSubRedditData.isEmpty {
            cachedSubRedditDataRepository.cachedSubRedditData = remoteSubRedditDataRepository.getAllSubRedditData()
        }
        return cachedSubRedditDataRepository.cachedSubRedditData
    }
    
}



