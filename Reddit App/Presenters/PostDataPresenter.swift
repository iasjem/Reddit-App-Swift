//
//  PostDataPresenter.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 28/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


/** MARK: protocol PostData View **/
    protocol PostDataView: class {
        
        func startLoading()
        func finishLoading()
        func setPostData(_ postData: [PostData])
        func emptyPostData(_ errMessage: String)
        func setSubRedditData(_ subRedditData: [SubRedditData])
        
    }


/** MARK: presenter PostData Presenter **/
    class PostDataPresenter {
        
        weak var postDataView: PostDataView?
        fileprivate let postDataRepository: PostDataRepository
        
        weak var subscribeDataView: SubscribeDataView?
        fileprivate let subRedditDataRepository: SubRedditDataRepository
        
        
        init(postDataRepository: PostDataRepository, subRedditDataRepository: SubRedditDataRepository) {
            self.postDataRepository = postDataRepository
             self.subRedditDataRepository = subRedditDataRepository
        }
        
        func attachPostDataView(_ postData: PostDataView, _ subRedditData: SubscribeDataView) {
            postDataView = postData
            subscribeDataView = subRedditData
        }
        
        func detachPostDataView () {
            postDataView = nil
            subscribeDataView = nil
        }
        
        func getPostData(_ subReddit: String) {
            postDataRepository.clearAllPostData()
            subRedditDataRepository.clearAllSubRedditData()
            
            self.postDataView?.startLoading()
            
            let delayTime = DispatchTime.now() + Double(Int64(3 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            
                DispatchQueue.main.asyncAfter(deadline: delayTime) {
                    self.postDataRepository.getAllPostData({ () -> String in
                        
                        return subReddit
                        
                    }, { (postData) in
                        
                           self.postDataView?.finishLoading()
                           self.postDataView?.setPostData(postData)
                        
                    }, { (errMessage) in
                        
                            self.postDataView?.finishLoading()
                            self.postDataView?.emptyPostData(errMessage)
                        
                            print(errMessage)
                        
                    })
                
                    self.subRedditDataRepository.getAllSubRedditData({ (subRedditData) in

                        self.subscribeDataView?.setSubRedditData(subRedditData)
                        
                    }) { (errMessage) in

                        print(errMessage)
                    }
                }

        }
        
    }
