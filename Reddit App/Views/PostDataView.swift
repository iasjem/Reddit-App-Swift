//
//  PostDataView.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 28/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit

protocol PostDataView: class {
    func setYellowCell(_ postTitle: String, _ postText:String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String)
    func setBlueCell(_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String)
    func setImageCell(_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String)

}
