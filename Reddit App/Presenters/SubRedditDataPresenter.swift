//
//  SubRedditDataPresenter.swift
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
    
    func setSubRedditData(_ subRedditData: [SubRedditData])
    
}

protocol SearchResultDataViewPresenter {
    init(view: SearchResultDataView, subredditdata: [SubRedditData])
    func showSearchResultCell(_ index: Int)

}

class SearchResultDataPresenter: SearchResultDataViewPresenter {
    unowned let view: SearchResultDataView
    var searchresultdata: [SubRedditData]
    
    required init(view: SearchResultDataView, subredditdata: [SubRedditData]) {
        self.view = view
        self.searchresultdata = subredditdata
    }
    
    func showSearchResultCell(_ index: Int) {
        
//        searchresultdata = dataManager.getSubRedditData()
//        
//        let icon = self.searchresultdata[index].subRedditIcon
//        let displayNamePrefixed = self.searchresultdata[index].displayNamePrefixed
//        let subscriberCount = self.searchresultdata[index].subscribers
//        
//        self.view.setSearchResultCell(icon, displayNamePrefixed, subscriberCount)
    }
    
}


//class SubscribeDataPresenter {
//
//    weak var subscribeDataView: SubscribeDataView?
//    fileprivate let subRedditDataRepository: SubRedditDataRepository
//    
//    init(subRedditDataRepository: SubRedditDataRepository) {
//        self.subRedditDataRepository = subRedditDataRepository
//    }
//    
//    func attachSubRedditDataView(_ postdata: SubscribeDataView) {
//        subscribeDataView = postdata
//    }
//    
//    func detachSubRedditDataView () {
//        subscribeDataView = nil
//    }
//    
//    func getSubscribeData() {
//        
//        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
//        DispatchQueue.main.asyncAfter(deadline: delayTime) {
//            
//            self.subRedditDataRepository.getAllSubRedditData({ (subRedditData) in
//             self.subscribeDataView?.setSubRedditData(subRedditData)
//            }) { (errMessage) in
//                print(errMessage)
//            }
//            
//        }
//        
//        
//    }
//
//}
