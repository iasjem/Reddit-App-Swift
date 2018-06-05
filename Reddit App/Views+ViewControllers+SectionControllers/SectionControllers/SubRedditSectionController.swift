//
//  SubRedditSectionController.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 04/06/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import IGListKit


/** MARK: sectioncontroller SubRedditSectionController **/
    class SubRedditSectionController: ListSectionController {

        var currentSubRedditData: [SubRedditData]?

        
        override init() {
            super.init()
            inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
        }
        
        
        override func didUpdate(to object: Any) {
            guard let subRedditData = object as? [SubRedditData] else {
                return
            }
            currentSubRedditData = subRedditData
        }
        
        
        override func numberOfItems() -> Int {
            return 1 
        }

        
        override func cellForItem(at index: Int) -> UICollectionViewCell {

            guard let ctx = collectionContext, let subRedditData = currentSubRedditData else {
                return SubscribeCell()
            }
            
            let cell = ctx.dequeueReusableCell(withNibName: "SubscribeCell", bundle: nil, for: self, at: index)
            
            if let cell = cell as? SubscribeCell {
                cell.displayFirstSubscribeCell(subRedditData[0])
                cell.displaySecondSubscribeCell(subRedditData[1])
                cell.displayThirdSubscribeCell(subRedditData[2])
            }
            
            return cell
        } 

        
        override func sizeForItem(at index: Int) -> CGSize {
            return CGSize(width: collectionContext!.containerSize.width - 30, height: 270)
        }

    }
