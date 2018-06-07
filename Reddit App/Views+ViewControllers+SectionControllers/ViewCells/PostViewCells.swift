//
//  PostViewCells.swift
//  Contains data to be displayed as content on its collection view cell
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit
import Reusable


/** MARK: cells PostDataCells **/
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

    }



