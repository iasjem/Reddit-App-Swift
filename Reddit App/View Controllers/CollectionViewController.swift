//
//  CollectionViewController.swift
//  Main view controller of app (the Dashboard)
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var randomIndex = 0
    var myDate = MyDate()
    var cellCount = 0
    var cellViews = ["firstCell", "secondCell", "thirdCell", "fourthCell"]
    var redditData = RedditData()
    var apiClient = API()
    let identifier = "firstCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = SnappingFlowLayout()
        
        apiClient.connectToAPI() // connect to API
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            //        let identifier = cellViews[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
       
        return cell
    }
    
}


