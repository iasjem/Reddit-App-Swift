//
//  Globals.swift
//  This file contains functions that can be globally used throughout the project
//
//  Created by Jemimah Beryl M. Sai on 28/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


/** MARK: Perform UI Updates **/
    func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
        DispatchQueue.main.async {  updates()  }
    }


/** MARK: Cells Image **/
    private var imageURL: URL?

        func getImageURL (_ postImage: String, cell: UIImageView) {
            imageURL = URL(string: postImage)
            
            if imageURL == nil {
                
                cell.image = UIImage(named: "NoImageAvailable")
                
            } else {
                
                guard let imageData = try? Data(contentsOf: imageURL!) else {
                    return cell.image = UIImage(named: "NoImageAvailable")
                }
                
                return cell.image = UIImage(data: imageData)
                
            }
        }


/** MARK: Number Conversion **/
    private let numberFormatter = NumberFormatter()

        func getSubscriberCount(_ subscribersCount: Int, cell: UILabel) {
            var subCount: String = ""
            
            if (subscribersCount >= 1000 && subscribersCount < 1000000) {
                subCount = "\(String(format: "%.2f", Double(subscribersCount) * 0.001))k subscribers"
            } else if (subscribersCount > 1000000) {
                subCount = "\(String(format: "%.2f", Double(subscribersCount) * 0.000001))m subscribers"
            }
            
            cell.text = subCount
        }



