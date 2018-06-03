//
//  SubRedditDataPresenter.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 28/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit



/** MARK: protocol SubscribeDataView **/
    protocol SubscribeDataView: class {

        func setSubRedditData(_ subRedditData: [SubRedditData])
        
    }


/** MARK: protocol SearchResultDataView **/
    protocol SearchResultDataView: class {
        
        func startLoading()
        func finishLoading()
        func emptySubRedditData(_ errMessage: String)
        func setSubRedditData(_ subRedditData: [SubRedditData])
        
    }


/** MARK: presenter SearchResultData **/
class SearchResultDataPresenter {
        
        weak var searchResultDataView: SearchResultDataView?
        fileprivate let subRedditDataRepository: SubRedditDataRepository
        
        
        init(subRedditDataRepository: SubRedditDataRepository) {
            self.subRedditDataRepository = subRedditDataRepository
        }
        
        func attachSubRedditDataView(_ postdata: SearchResultDataView) {
            searchResultDataView = postdata
        }
        
        func detachSubRedditDataView () {
            searchResultDataView = nil
        }
        
        func getSearchResults() {
            
            subRedditDataRepository.clearAllSubRedditData()
            
            searchResultDataView?.startLoading()
            
            self.subRedditDataRepository.getAllSubRedditData({ (subRedditData) in
                
                self.searchResultDataView?.finishLoading()
                self.searchResultDataView?.setSubRedditData(subRedditData)
                
                }) { (errMessage) in
                    
                    self.searchResultDataView?.finishLoading()
                    self.searchResultDataView?.emptySubRedditData(errMessage)
                    print(errMessage)
                    
                }
        }
        
    }
