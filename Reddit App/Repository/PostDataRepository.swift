//
//  PostDataRepository.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 29/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


protocol PostDataRepository {
    
    func getAllPostData() -> [PostData]
    func clearAllPostData()

}


protocol CachedPostData {
    
    var cachedPostData: [PostData] { get set }
    
}
