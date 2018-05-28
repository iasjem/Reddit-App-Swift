//
//  TableViewCells.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 25/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit

class SearchResultCell: UITableViewCell, SearchResultDataView { // search results based on JSON data fetched from API
    
    var presenter: SearchResultDataPresenter!
    
    @IBOutlet weak var SubRedditIcon: UIImageView!
    @IBOutlet weak var SubRedditName: UILabel!
    @IBOutlet weak var SubscribersCount: UILabel!
    
    func displaySearchResultCell () {
        self.presenter.showSearchResultCell()
    }
    
    func setSearchResultCell(_ icon: String, _ displayNamePrefixed: String, _ subscribersCount: Int) {
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


class SubscribeCell: UICollectionViewCell, SubscribeDataView  { // cell with subscription boxes for subreddits
    var presenter: SubscribeDataPresenter!
    
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
    
    func displaySubscribeCellOne () {
        self.presenter.showSubscribeCellOne()
    } // display first subscribe cell
    
    func displaySubscribeCellTwo () {
        self.presenter.showSubscribeCellTwo()
    } // display first subscribe cell
    
    func displaySubscribeCellThree () {
        self.presenter.showSubscribeCellThree() 
    } // display first subscribe cell
    
    
    func setSubscribeCellOne(_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String) {
        let iconURL = URL(string: icon)
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        
        DisplayNameOne.text = displayName
        SubscribeCountOne.text = "\(String(describing: formater.string(from: NSNumber(value:subscribersCount))!)) subscribers"
        PublicDescriptionOne.text = publicDescription
        if iconURL == nil {
            self.SubRedditIconOne.image = UIImage(named: "NoImageAvailable")
        } else {
            guard let imageData = try? Data(contentsOf: iconURL!) else {
                self.SubRedditIconOne.image = UIImage(named: "NoImageAvailable")
                return
            }
            self.SubRedditIconOne.image = UIImage(data: imageData)
        }
    }
    
    
    func setSubscribeCellTwo(_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String) {
        let iconURL = URL(string: icon)
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        
        DisplayNameTwo.text = displayName
        SubscribeCountTwo.text = "\(String(describing: formater.string(from: NSNumber(value:subscribersCount))!)) subscribers"
        PublicDescriptionTwo.text = publicDescription
        if iconURL == nil {
            self.SubRedditIconTwo.image = UIImage(named: "NoImageAvailable")
        } else {
            guard let imageData = try? Data(contentsOf: iconURL!) else {
                self.SubRedditIconTwo.image = UIImage(named: "NoImageAvailable")
                return
            }
            self.SubRedditIconTwo.image = UIImage(data: imageData)
        }
    }
    
    
    func setSubscribeCellThree(_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String, _ bannerImage: String) {
        
        let iconURL = URL(string: icon)
        let bannerURL = URL(string: bannerImage)
        
        let formater = NumberFormatter()
        formater.numberStyle = .decimal
        
        DisplayNameThree.text = displayName
        SubscribeCountThree.text = "\(String(describing: formater.string(from: NSNumber(value:subscribersCount))!)) subscribers"
        PublicDescriptionThree.text = publicDescription
        
        if iconURL == nil {
            self.SubRedditIconThree.image = UIImage(named: "NoImageAvailable")
        } else {
            guard let imageData = try? Data(contentsOf: iconURL!) else {
                self.SubRedditIconThree.image = UIImage(named: "NoImageAvailable")
                return
            }
            self.SubRedditIconThree.image = UIImage(data: imageData)
        }
        
        if bannerURL == nil {
            self.BannerImageThree.image = UIImage(named: "NoImageAvailable")
        } else {
            guard let imageData = try? Data(contentsOf: bannerURL!) else {
                self.BannerImageThree.image = UIImage(named: "NoImageAvailable")
                return
            }
            
            self.BannerImageThree.image = UIImage(data: imageData)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
