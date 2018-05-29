//
//  SubRedditDataPresenter.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 28/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit

protocol SearchResultDataViewPresenter {
    init(view: SearchResultDataView, subredditdata: SubRedditData)
    func showSearchResultCell()

}

class SearchResultDataPresenter: SearchResultDataViewPresenter {
    unowned let view: SearchResultDataView
    let searchresultdata: SubRedditData
    
    required init(view: SearchResultDataView, subredditdata: SubRedditData) { 
        self.view = view
        self.searchresultdata = subredditdata
    }
    
    func showSearchResultCell() {
        let icon = self.searchresultdata.subRedditIcon
        let displayNamePrefixed = self.searchresultdata.displayNamePrefixed
        let subscriberCount = self.searchresultdata.subscribers
        
        self.view.setSearchResultCell(icon, displayNamePrefixed, subscriberCount)
    }
    
}

protocol SubscribeDataViewPresenter {
    init(view: SubscribeDataView, subscribedata: SubRedditData)
    func showAllSubscribeCell()
    
}

class SubscribeDataPresenter: SubscribeDataViewPresenter {
    unowned let view: SubscribeDataView
    let subscribedata: SubRedditData
    
    required init(view: SubscribeDataView, subscribedata: SubRedditData) {
        self.view = view
        self.subscribedata = subscribedata
    }
    
    func showAllSubscribeCell() {
        let icon = self.subscribedata.subRedditIcon
        let displayName = self.subscribedata.displayName
        let subscriberCount = self.subscribedata.subscribers
        let publicDescription = self.subscribedata.publicDescription
        let bannerImage = self.subscribedata.bannerImage
        
        self.view.setSubscribeCellOne(icon, displayName, subscriberCount, publicDescription)
        self.view.setSubscribeCellTwo(icon, displayName, subscriberCount, publicDescription)
        self.view.setSubscribeCellThree(icon, displayName, subscriberCount, publicDescription, bannerImage)
    }
    
}
