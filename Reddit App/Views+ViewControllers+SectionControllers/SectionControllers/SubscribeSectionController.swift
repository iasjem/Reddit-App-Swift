//
//  SubRedditSectionController.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 04/06/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import IGListKit
import Reusable

/** MARK: sectioncontroller SubRedditSectionController **/
    class SubscribeSectionController: ListSectionController {

        var currentSubscribeData: SubscribeData?
        
        override init() {
            super.init()
            inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        }
        
        override func didUpdate(to object: Any) {
            guard let subscribeData = object as? SubscribeData else {
                return
            }
            currentSubscribeData = subscribeData
        }
        
        override func numberOfItems() -> Int {
            return 1 
        }
        
        override func cellForItem(at index: Int) -> UICollectionViewCell {

            guard let ctx = collectionContext, let subscribeData = self.currentSubscribeData else {
                return SubscribeCell()
            }
            let cell = ctx.dequeueReusableCell(withNibName: SubscribeCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index)
            
                if let cell = cell as? SubscribeCell {
                    
                    cell.firstDisplayName.text = subscribeData.subRedditDataOne.displayNamePrefixed
                    cell.firstPublicDescription.text = subscribeData.subRedditDataOne.publicDescription
                    
                    getSubscriberCount(subscribeData.subRedditDataOne.subscribers, cell: cell.firstSubscribersCount) // Please see Globals swift file to see function
                    getImageURL(subscribeData.subRedditDataOne.subRedditIcon, cell: cell.firstSubRedditIcon)
                    
                    cell.secondDisplayName.text = subscribeData.subRedditDataTwo.displayNamePrefixed
                    cell.secondPublicDescription.text = subscribeData.subRedditDataTwo.publicDescription
                    
                    getSubscriberCount(subscribeData.subRedditDataTwo.subscribers, cell: cell.secondSubscribersCount) // Please see Globals swift file to see function
                    getImageURL(subscribeData.subRedditDataTwo.subRedditIcon, cell: cell.secondSubRedditIcon)
                    
                    cell.thirdDisplayName.text = subscribeData.subRedditDataThree.displayNamePrefixed
                    cell.thirdPublicDescription.text = subscribeData.subRedditDataThree.publicDescription
                    
                    getSubscriberCount(subscribeData.subRedditDataThree.subscribers, cell: cell.thirdSubscribersCount) // Please see Globals swift file to see function
                    getImageURL(subscribeData.subRedditDataThree.subRedditIcon, cell: cell.thirdSubRedditIcon)
                    getImageURL(subscribeData.subRedditDataThree.bannerImage, cell: cell.thirdBannerImage)
                    
                }
            
            return cell
            
        }
        
        override func sizeForItem(at index: Int) -> CGSize {
            return CGSize(width: collectionContext!.containerSize.width - 30, height: 270)
        }

    }
