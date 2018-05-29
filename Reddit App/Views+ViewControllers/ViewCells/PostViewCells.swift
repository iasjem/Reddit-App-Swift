//
//  PostViewCells.swift
//  Contains data to be displayed as content on its collection view cell
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit


protocol PostDataView: class {
    
    func setYellowCell(_ postTitle: String, _ postText:String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String)
    func setBlueCell(_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String)
    func setImageCell(_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String)
    
}


class PostDataCells: UICollectionViewCell, PostDataView {
    
    var presenter: PostDataViewPresenter!
    
    @IBOutlet weak var YellowCellSubReddit: UILabel!
    @IBOutlet weak var YellowCellPostAuthor: UILabel!
    @IBOutlet weak var YellowCellPostTime: UILabel!
    @IBOutlet weak var YellowCellPostTitle: UITextView!
    @IBOutlet weak var YellowCellPostText: UITextView!
    @IBOutlet weak var YellowCellPostImage: UIImageView!
    
    @IBOutlet weak var BlueCellSubReddit: UILabel!
    @IBOutlet weak var BlueCellPostAuthor: UILabel!
    @IBOutlet weak var BlueCellPostTime: UILabel!
    @IBOutlet weak var BlueCellPostTitle: UITextView!
    @IBOutlet weak var BlueCellPostImage: UIImageView!
    
    @IBOutlet weak var ImageCellPostImage: UIImageView!
    @IBOutlet weak var ImageCellPostTitle: UITextView!
    @IBOutlet weak var ImageCellPostTime: UILabel!
    @IBOutlet weak var ImageCellSubReddit: UILabel!
    @IBOutlet weak var ImageCellPostAuthor: UILabel!
    
    
    func setYellowCell(_ postTitle: String, _ postText: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {

        YellowCellPostTitle.text = postTitle
        YellowCellSubReddit.text = subReddit
        YellowCellPostAuthor.text = postAuthor
        YellowCellPostTime.text = postTime
        YellowCellPostText.text = postText
        getImageURL(postImage, cell: YellowCellPostImage) // Please see Globals swift file to see function

    }
    
    
    func setBlueCell(_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {
        
        BlueCellPostTitle.text = postTitle
        BlueCellSubReddit.text = subReddit
        BlueCellPostAuthor.text = postAuthor
        BlueCellPostTime.text = postTime
        getImageURL(postImage, cell: BlueCellPostImage) // Please see Globals swift file to see function
        
    }
    
    
    func setImageCell(_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {

        ImageCellPostTitle.text = postTitle
        ImageCellSubReddit.text = subReddit
        ImageCellPostAuthor.text = postAuthor
        ImageCellPostTime.text = postTime
        getImageURL(postImage, cell: ImageCellPostImage) // Please see Globals swift file to see function
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}



