//
//  SubRedditViewCells.swift
//  All cells related to subreddit data including SearchResultCells and SubscribeCells
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


/** MARK: viewcells SearchResult Celll **/
    class SearchResultCell: UITableViewCell { // search results based on JSON data fetched from API
        
        @IBOutlet weak var subRedditIcon: UIImageView!
        @IBOutlet weak var subRedditName: UILabel!
        @IBOutlet weak var subscribersCount: UILabel!
        
    }


/** MARK: viewcells Subscribe Celll **/
    class SubscribeCell: UICollectionViewCell  { // cell with subscription boxes for subreddits
        
        @IBOutlet weak var firstSubRedditIcon: UIImageView!
        @IBOutlet weak var firstDisplayName: UILabel!
        @IBOutlet weak var firstPublicDescription: UITextView!
        @IBOutlet weak var firstSubscribersCount: UILabel!
        
        @IBOutlet weak var secondSubRedditIcon: UIImageView!
        @IBOutlet weak var secondDisplayName: UILabel!
        @IBOutlet weak var secondPublicDescription: UITextView!
        @IBOutlet weak var secondSubscribersCount: UILabel!
        
        @IBOutlet weak var thirdSubRedditIcon: UIImageView!
        @IBOutlet weak var thirdDisplayName: UILabel!
        @IBOutlet weak var thirdPublicDescription: UITextView!
        @IBOutlet weak var thirdSubscribersCount: UILabel!
        @IBOutlet weak var thirdBannerImage: UIImageView!
        
        
        func displayFirstSubscribeCell(_ subRedditData: SubRedditData) {
            
            firstDisplayName.text = subRedditData.displayName
            firstPublicDescription.text = subRedditData.publicDescription

            getSubscriberCount(subRedditData.subscribers, cell: firstSubscribersCount) // Please see Globals swift file to see function
            getImageURL(subRedditData.subRedditIcon, cell: firstSubRedditIcon)
            
        }
        
        
        func displaySecondSubscribeCell(_ subRedditData: SubRedditData) {
            
            secondDisplayName.text = subRedditData.displayName
            secondPublicDescription.text = subRedditData.publicDescription

            getSubscriberCount(subRedditData.subscribers, cell: secondSubscribersCount) // Please see Globals swift file to see function
            getImageURL(subRedditData.subRedditIcon, cell: secondSubRedditIcon)
            
        }
        
        
        func displayThirdSubscribeCell(_ subRedditData: SubRedditData) {
            
            thirdDisplayName.text = subRedditData.displayName
            thirdPublicDescription.text = subRedditData.publicDescription

            getSubscriberCount(subRedditData.subscribers, cell: thirdSubscribersCount) // Please see Globals swift file to see function
            getImageURL(subRedditData.subRedditIcon, cell: thirdSubRedditIcon)
            getImageURL(subRedditData.bannerImage, cell: thirdBannerImage)
            
        }
        
    }
