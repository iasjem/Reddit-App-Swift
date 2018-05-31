//
//  SubRedditViewCells.swift
//  All cells related to subreddit data including SearchResultCells and SubscribeCells
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


class SearchResultCell: UITableViewCell { // search results based on JSON data fetched from API 
    
    @IBOutlet weak var SubRedditIcon: UIImageView!
    @IBOutlet weak var SubRedditName: UILabel!
    @IBOutlet weak var SubscribersCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


class SubscribeCell: UICollectionViewCell  { // cell with subscription boxes for subreddits
    
    @IBOutlet weak var SubRedditIconOne: UIImageView!
    @IBOutlet weak var DisplayNameOne: UILabel!
    @IBOutlet weak var PublicDescriptionOne: UITextView!
    @IBOutlet weak var SubscribeCountOne: UILabel!
    
    @IBOutlet weak var SubRedditIconTwo: UIImageView!
    @IBOutlet weak var DisplayNameTwo: UILabel!
    @IBOutlet weak var PublicDescriptionTwo: UITextView!
    @IBOutlet weak var SubscribeCountTwo: UILabel!
    
    @IBOutlet weak var SubRedditIconThree: UIImageView!
    @IBOutlet weak var DisplayNameThree: UILabel!
    @IBOutlet weak var PublicDescriptionThree: UITextView!
    @IBOutlet weak var SubscribeCountThree: UILabel!
    @IBOutlet weak var BannerImageThree: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
