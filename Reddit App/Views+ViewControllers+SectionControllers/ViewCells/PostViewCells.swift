//
//  PostViewCells.swift
//  Contains data to be displayed as content on its collection view cell
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit


/** MARK: viewcells PostData Cells **/
    class PostDataCells: UICollectionViewCell {
        
        @IBOutlet weak var yellowCellSubReddit: UILabel!
        @IBOutlet weak var yellowCellPostAuthor: UILabel!
        @IBOutlet weak var yellowCellPostTime: UILabel!
        @IBOutlet weak var yellowCellPostTitle: UITextView!
        @IBOutlet weak var yellowCellPostText: UITextView!
        @IBOutlet weak var yellowCellPostImage: UIImageView!
        
        @IBOutlet weak var blueCellSubReddit: UILabel!
        @IBOutlet weak var blueCellPostAuthor: UILabel!
        @IBOutlet weak var blueCellPostTime: UILabel!
        @IBOutlet weak var blueCellPostTitle: UITextView!
        @IBOutlet weak var blueCellPostImage: UIImageView!
        
        @IBOutlet weak var imageCellPostImage: UIImageView!
        @IBOutlet weak var imageCellPostTitle: UITextView!
        @IBOutlet weak var imageCellPostTime: UILabel!
        @IBOutlet weak var imageCellSubReddit: UILabel!
        @IBOutlet weak var imageCellPostAuthor: UILabel!
     
        
        func displayYellowCell (_ postData: PostData) {
            
            yellowCellPostTitle.text = postData.title
            yellowCellSubReddit.text = postData.subreddit
            yellowCellPostAuthor.text = postData.author
            yellowCellPostTime.text = postData.createdUTC
            yellowCellPostText.text = postData.selfText
            
            getImageURL(postData.imageURL, cell: yellowCellPostImage) // Please see Globals swift file to see function

        }
        
        
        func displayBlueCell (_ postData: PostData) {
            
            blueCellPostTitle.text = postData.title
            blueCellSubReddit.text = postData.subreddit
            blueCellPostAuthor.text = postData.author
            blueCellPostTime.text = postData.createdUTC
            
            getImageURL(postData.imageURL, cell: blueCellPostImage) // Please see Globals swift file to see function

        }
        
        
        func displayImageCell (_ postData: PostData) {
            
            imageCellPostTitle.text = postData.title
            imageCellSubReddit.text = postData.subreddit
            imageCellPostAuthor.text = postData.author
            imageCellPostTime.text = postData.createdUTC
            
            getImageURL(postData.imageURL, cell: imageCellPostImage) // Please see Globals swift file to see functionL)

        }
        
        
    }



