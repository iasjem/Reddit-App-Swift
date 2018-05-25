//
//  ViewCells.swift
//  Contains data to be displayed as content on its collection view cell
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

class YellowCell: UICollectionViewCell   { // cell with post description (SelfText)
    
    @IBOutlet weak var CellPostImage: UIImageView!
    @IBOutlet weak var CellPostTitle: UITextView!
    @IBOutlet weak var CellPostText: UITextView!
    @IBOutlet weak var CellSubReddit: UILabel!
    @IBOutlet weak var CellPostAuthor: UILabel!
    @IBOutlet weak var CellPostTime: UILabel!
    
    func displayCollectionViewCell (_ postTitle: String, _ postText:String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {
        let imageURL = URL(string: postImage) 

        CellPostTitle.text = postTitle
        CellSubReddit.text = subReddit
        CellPostAuthor.text = postAuthor
        CellPostTime.text = postTime
        CellPostText.text = postText
        
        guard let imageData = try? Data(contentsOf: imageURL!) else {
            self.CellPostImage.image = UIImage(named: "NoImageAvailable")
            return
        }
        
        self.CellPostImage.image = UIImage(data: imageData)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}


class BlueCell: UICollectionViewCell   { // Cell with post title only
    
    @IBOutlet weak var CellPostImage: UIImageView!
    @IBOutlet weak var CellPostTitle: UITextView!
    @IBOutlet weak var CellSubReddit: UILabel!
    @IBOutlet weak var CellPostAuthor: UILabel!
    @IBOutlet weak var CellPostTime: UILabel!
    
    func displayCollectionViewCell (_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {
        let imageURL = URL(string: postImage)
        
        CellPostTitle.text = postTitle
        CellSubReddit.text = subReddit
        CellPostAuthor.text = postAuthor
        CellPostTime.text = postTime
        
        guard let imageData = try? Data(contentsOf: imageURL!) else {
            self.CellPostImage.image = UIImage(named: "NoImageAvailable")
            return
        }
        self.CellPostImage.image = UIImage(data: imageData)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}


class ImageCell: UICollectionViewCell   { // Cell with post title only but with wider post image
    
    @IBOutlet weak var CellPostImage: UIImageView!
    @IBOutlet weak var CellPostTitle: UITextView!
    @IBOutlet weak var CellSubReddit: UILabel!
    @IBOutlet weak var CellPostAuthor: UILabel!
    @IBOutlet weak var CellPostTime: UILabel!
    
    func displayCollectionViewCell (_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {
        let imageURL = URL(string: postImage)
        
        CellPostTitle.text = postTitle
        CellSubReddit.text = subReddit
        CellPostAuthor.text = postAuthor
        CellPostTime.text = postTime
        
        guard let imageData = try? Data(contentsOf: imageURL!) else {
            self.CellPostImage.image = UIImage(named: "NoImageAvailable")
            return
        }
        self.CellPostImage.image = UIImage(data: imageData)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}


class SubscribeCell: UICollectionViewCell   { // cell with subscription boxes for subreddits

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
    
    func displaySubscribeCellOne (_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String) {
        
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
    } // display first subscribe cell
    
    
    func displaySubscribeCellTwo (_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String) {
        
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
    } // display second subscribe cell
    
    
    func displaySubscribeCellThree (_ icon: String, _ displayName: String, _ subscribersCount: Int, _ publicDescription: String, _ bannerImage: String) {
        
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
    } // display third subscribe cell
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

