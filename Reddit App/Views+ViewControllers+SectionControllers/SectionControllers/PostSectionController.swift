//
//  PostSectionController.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 04/06/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import IGListKit


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

                let cell = ctx.dequeueReusableCell(withNibName: "YellowCell", bundle: nil, for: self, at: index) as! PostDataCells
                    cell.displayYellowCell(postData)
                return cell
                
            } else {

                if postData.imageWidth <= 600 {

                    let cell = ctx.dequeueReusableCell(withNibName: "BlueCell", bundle: nil, for: self, at: index) as! PostDataCells
                        cell.displayBlueCell(postData)
                    return cell

                }  else {
                    
                    let cell = ctx.dequeueReusableCell(withNibName: "ImageCell", bundle: nil, for: self, at: index) as! PostDataCells
                        cell.displayImageCell(postData)
                    return cell
                    
                }
            }
            
        } 

        
        override func sizeForItem(at index: Int) -> CGSize {
            return CGSize(width: collectionContext!.containerSize.width - 30, height: 270)
        }

    }
