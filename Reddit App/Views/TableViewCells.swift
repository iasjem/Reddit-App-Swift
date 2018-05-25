//
//  TableViewCells.swift
//  RedditApp
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
    
    func displaySearchResults (_ icon: String, _ displayNamePrefixed: String, _ subscribersCount: Int) {
        
        let iconURL = URL(string: icon)
        let formater = NumberFormatter()
        
        formater.numberStyle = .decimal
        
        SubRedditName.text = displayNamePrefixed
        SubscribersCount.text = "\(String(describing: formater.string(from: NSNumber(value:subscribersCount))!)) subscribers"
        
        if iconURL == nil {
            self.SubRedditIcon.image = UIImage(named: "NoImageAvailable")
        } else {
            guard let imageData = try? Data(contentsOf: iconURL!) else {
                self.SubRedditIcon.image = UIImage(named: "NoImageAvailable")
                return
            }
            self.SubRedditIcon.image = UIImage(data: imageData)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
