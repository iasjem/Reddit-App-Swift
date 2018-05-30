//
//  PostViewCells.swift
//  Contains data to be displayed as content on its collection view cell
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit


class PostDataCells: UICollectionViewCell {
    
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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}



