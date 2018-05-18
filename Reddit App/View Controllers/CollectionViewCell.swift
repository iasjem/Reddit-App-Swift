//
//  CollectionViewCell.swift
//  Contains data to be displayed as content on its collection view cell
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell   {
    
    @IBOutlet weak var firstCellPostImage: UIImageView!
    @IBOutlet weak var firstCellPostTitle: UITextView!
    @IBOutlet weak var firstCellPostText: UITextView!
    @IBOutlet weak var firstCellSubReddit: UILabel!
    @IBOutlet weak var firstCellPostAuthor: UILabel!
    @IBOutlet weak var firstCellPostTime: UILabel!
    
    @IBOutlet weak var secondCellPostImage: UIImageView!
    @IBOutlet weak var secondCellPostTitle: UITextView!
    @IBOutlet weak var secondCellSubReddit: UILabel!
    @IBOutlet weak var secondCellPostAuthor: UILabel!
    @IBOutlet weak var secondCellPostTime: UILabel!
    
    @IBOutlet weak var fourthCellPostTitle: UITextView!
    @IBOutlet weak var fourthCellPostImage: UIImageView!
    @IBOutlet weak var fourthCellPostAuthor: UILabel!
    @IBOutlet weak var fourthCellSubReddit: UILabel!
    @IBOutlet weak var fourthCellPostTime: UILabel!
    
    func getMyCell (_ postTitle: String, _ postText:String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {
        let imageURL = URL(string: postImage) 
        
        firstCellPostTitle.text = postTitle
        firstCellPostText.text = postText
        firstCellSubReddit.text = "r/\(subReddit)"
        firstCellPostAuthor.text = postAuthor
        firstCellPostTime.text = postTime

        guard let imageData = try? Data(contentsOf: imageURL!) else { 
            self.firstCellPostImage.image = UIImage(named: "NoImageAvailable")
            return
        }
            self.firstCellPostImage.image = UIImage(data: imageData)

    }
    
//    func getMyCell (_ identifier: String, _ myList: [jsonData]) {
//
//        let index = myList.count
//        let postImage: String? = myList[index].imageUrl
//        let postTitle = myList[index].title
//        let subReddit = myList[index].subreddit
//        let postText: String? = myList[index].selfText
//        let postTime = myList[index].createdUTC
//        let postAuthor = myList[index].author
//
//        let imageURL = URL(string: postImage!)
//        switch identifier {
//            case "firstCell":
//                    self.firstCellPostTitle.text = postTitle
//                    self.firstCellPostText.text = postText
//                    self.firstCellSubReddit.text = "r/\(subReddit)"
//                    self.firstCellPostAuthor.text = postAuthor
//                    self.firstCellPostTime.text = postTime
//
//                    guard let imageData = try? Data(contentsOf: imageURL!) else {
//                        self.firstCellPostImage.image = UIImage(named: "NoImageAvailable")
//                        return
//                    }
//                        self.firstCellPostImage.image = UIImage(data: imageData)
//
//            case "secondCell":
//                self.secondCellPostTitle.text = postTitle
//                self.secondCellSubReddit.text = "r/\(subReddit)"
//                self.secondCellPostAuthor.text = postAuthor
//                self.secondCellPostTime.text = postTime
//
//                guard let imageData = try? Data(contentsOf: imageURL!) else {
//                    secondCellPostImage.image = UIImage(named: "NoImageAvailable")
//                    return
//                }
//                    secondCellPostImage.image = UIImage(data: imageData)
//
//            case "fourthCell":
//                self.fourthCellPostTitle.text = postTitle
//                self.fourthCellSubReddit.text = "r/\(subReddit)"
//                self.fourthCellPostAuthor.text = postAuthor
//                self.fourthCellPostTime.text = postTime
//
//                guard let imageData = try? Data(contentsOf: imageURL!) else {
//                    fourthCellPostImage.image = UIImage(named: "NoImageAvailable")
//                    return
//                }
//                    fourthCellPostImage.image = UIImage(data: imageData)
//
//                default:
//                    break;
//        }
//    }
    
} 

