//
//  ViewCells.swift
//  Contains data to be displayed as content on its collection view cell
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

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
    
    func displayYellowCell() {
        self.presenter.showYellowCell()
    }
    
    func displayBlueCell() {
        self.presenter.showBlueCell()
    }
    
    func displayImageCell() {
        self.presenter.showImageCell()
    }
    
    func setYellowCell(_ postTitle: String, _ postText: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {
        let imageURL = URL(string: postImage)
        
        YellowCellPostTitle.text = postTitle
        YellowCellSubReddit.text = subReddit
        YellowCellPostAuthor.text = postAuthor
        YellowCellPostTime.text = postTime
        YellowCellPostText.text = postText
        
        guard let imageData = try? Data(contentsOf: imageURL!) else {
            self.YellowCellPostImage.image = UIImage(named: "NoImageAvailable")
            return
        }
        
        self.YellowCellPostImage.image = UIImage(data: imageData)
    }
    
    func setBlueCell(_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {
        let imageURL = URL(string: postImage)
        
        BlueCellPostTitle.text = postTitle
        BlueCellSubReddit.text = subReddit
        BlueCellPostAuthor.text = postAuthor
        BlueCellPostTime.text = postTime
        
        guard let imageData = try? Data(contentsOf: imageURL!) else {
            self.BlueCellPostImage.image = UIImage(named: "NoImageAvailable")
            return
        }
        self.BlueCellPostImage.image = UIImage(data: imageData)
    }
    
    func setImageCell(_ postTitle: String, _ subReddit: String, _ postAuthor: String, _ postTime: String, _ postImage: String) {
        let imageURL = URL(string: postImage)
        
        ImageCellPostTitle.text = postTitle
        ImageCellSubReddit.text = subReddit
        ImageCellPostAuthor.text = postAuthor
        ImageCellPostTime.text = postTime
        
        guard let imageData = try? Data(contentsOf: imageURL!) else {
            self.ImageCellPostImage.image = UIImage(named: "NoImageAvailable")
            return
        }
        self.ImageCellPostImage.image = UIImage(data: imageData)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}



