//
//  SubRedditView.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 28/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit

protocol SearchResultDataView: class {
    func setSearchResultCell (_ icon: String, _ displayNamePrefixed: String, _ subscribersCount: Int)
}

protocol SubscribeDataView: class {
    func setSubscribeCellOne (_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String)
    func setSubscribeCellTwo (_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String)
    func setSubscribeCellThree (_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String, _ bannerImage: String)
}
