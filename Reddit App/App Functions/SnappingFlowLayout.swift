//
//  SnappingFlowLayout.swift
//  Reddit App
//
//  Created by Jemimah Beryl M. Sai on 11/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit

class SnappingFlowLayout: UICollectionViewFlowLayout {
    private var firstSetupDone = false
    
    override func prepare() {
        super.prepare()
        if !firstSetupDone {
            setup()
            firstSetupDone = true
        }
    }
    
    private func setup() {
        scrollDirection = .vertical
        minimumLineSpacing = 20
        itemSize = CGSize(width: collectionView!.bounds.width, height: collectionView!.bounds.height / 2)
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
    }
}
