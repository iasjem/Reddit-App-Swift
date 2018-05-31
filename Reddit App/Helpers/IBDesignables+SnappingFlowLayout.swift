//
//  DesignUI.swift
//  Related to programmatically customized UI designs
//
//  Created by Jemimah Beryl M. Sai on 11/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


/** MARK: class Round Buttons **/
    @IBDesignable class RoundButton: UIButton {
        @IBInspectable var cornerRadius: CGFloat = 15 {
            didSet {
                refreshCorners(value: cornerRadius)
            }
        }
        override init(frame: CGRect) {
            super.init(frame: frame)
            sharedInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            sharedInit()
        }
        
        override func prepareForInterfaceBuilder() {
            sharedInit()
        }
        
        func sharedInit() {
            refreshCorners(value: cornerRadius)
        }
        
        func refreshCorners(value: CGFloat) {
            layer.cornerRadius = value
            layer.borderWidth = 1
            layer.borderColor = UIColor.lightGray.cgColor
        }
    }


/** MARK: class Snapping Flow Layout **/
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
                itemSize = CGSize(width: collectionView!.bounds.width, height: collectionView!.bounds.height / 2.25)
                collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
                collectionView!.contentInset = UIEdgeInsetsMake(0.0,0.0,75.0,0.0)
            }
        
    }
