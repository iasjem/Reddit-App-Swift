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

    var cellViews = ["firstCell", "secondCell", "thirdCell", "fourthCell"]

    let identifier = "firstCell"
    
    let store = JSONDataStore.sharedInstance

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = SnappingFlowLayout()
        
        
        DispatchQueue.main.async {
            self.store.connectToAPI() // connect to API
             self.store.delegate = self
        }
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.myList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell
        let list = store.myList[indexPath.row]
            cell.displayCollectionViewCell(list.title, list.selfText, list.subreddit, list.author, list.createdUTC, list.imageUrl)
        return cell
    }

}

extension CollectionViewController: refreshDelegate {
    func reloadView() {
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
}


