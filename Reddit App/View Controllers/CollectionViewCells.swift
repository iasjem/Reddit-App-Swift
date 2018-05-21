//
//  CollectionViewCell.swift
//  Contains data to be displayed as content on its collection view cell
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

class YellowCell: UICollectionViewCell   {
    
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

class BlueCell: UICollectionViewCell   {
    
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

class ImageCell: UICollectionViewCell   {
    
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

class SubscribeCell: UICollectionViewCell   {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
