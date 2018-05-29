//
//  Globals.swift
//  This file contains functions that can be globally used throughout the project
//
//  Created by Jemimah Beryl M. Sai on 28/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation
import UIKit


/** MARK: For data reloading on Post Collection View **/
func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    
    DispatchQueue.main.async {  updates()  }
    
}



/** MARK: For Post and Subreddit View Cells **/
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


private let numberFormatter = NumberFormatter()

func getSubscriberCount(_ subscribersCount: Int, cell: UILabel) {
    
    numberFormatter.numberStyle = .decimal
    cell.text = "\(String(describing: numberFormatter.string(from: NSNumber(value:subscribersCount))!)) subscribers"
    
}




