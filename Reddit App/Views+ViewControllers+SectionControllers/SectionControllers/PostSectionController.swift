//
//  PostSectionController.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 04/06/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import IGListKit
import Reusable

/** MARK: sectioncontroller PostSectionController **/
    class PostSectionController: ListSectionController {

        var currentPostData: PostData?
        
        override init() {
            super.init()
            inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        }
        
        override func didUpdate(to object: Any) {
            guard let postData = object as? PostData else {
                return
            }
            currentPostData = postData
        }
        
        override func numberOfItems() -> Int {
            return 1
            
        }

        override func cellForItem(at index: Int) -> UICollectionViewCell {
            
            guard let ctx = collectionContext, let postData = self.currentPostData else {
                return PostDataCells()
            }
            
            if postData.selfText != "" {
                
                let cell = ctx.dequeueReusableCell(withNibName: "YellowCell", bundle: Bundle.main, for: self, at: index) as! PostDataCells
                
                    cell.yellowCellPostTitle.text = postData.title
                    cell.yellowCellSubReddit.text = postData.subreddit
                    cell.yellowCellPostAuthor.text = postData.author
                    cell.yellowCellPostTime.text = postData.createdUTC
                    cell.yellowCellPostText.text = postData.selfText
                
                    getImageURL(postData.imageURL, cell: cell.yellowCellPostImage) // Please see Globals swift file to see function
                
                return cell
                
            } else {

                if postData.imageWidth <= 600 {

                    let cell = ctx.dequeueReusableCell(withNibName: "BlueCell", bundle: Bundle.main, for: self, at: index) as! PostDataCells

                        cell.blueCellPostTitle.text = postData.title
                        cell.blueCellSubReddit.text = postData.subreddit
                        cell.blueCellPostAuthor.text = postData.author
                        cell.blueCellPostTime.text = postData.createdUTC
                    
                        getImageURL(postData.imageURL, cell: cell.blueCellPostImage) // Please see Globals swift file to see function

                    return cell

                }  else {
                    
                    let cell = ctx.dequeueReusableCell(withNibName: "ImageCell", bundle: Bundle.main, for: self, at: index) as! PostDataCells
                    
                        cell.imageCellPostTitle.text = postData.title
                        cell.imageCellSubReddit.text = postData.subreddit
                        cell.imageCellPostAuthor.text = postData.author
                        cell.imageCellPostTime.text = postData.createdUTC
                    
                        getImageURL(postData.imageURL, cell: cell.imageCellPostImage) // Please see Globals swift file to see function
                    
                    return cell
                    
                }
            }
            
        } 
        
        override func sizeForItem(at index: Int) -> CGSize {
            return CGSize(width: collectionContext!.containerSize.width - 30, height: 270)
        }

    }

