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
            let srgb = UIColor(red: 237/255.0, green: 237/255.0, blue: 237/255.0, alpha: 1.0)
            layer.cornerRadius = value
            layer.borderWidth = 0.5
            layer.borderColor = srgb.cgColor 
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
                collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
                collectionView!.contentInset = UIEdgeInsetsMake(0.0,0.0,150.0,0.0)
            }
        
    }
