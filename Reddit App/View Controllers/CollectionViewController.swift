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
    
    let store = JSONDataStore.sharedInstance
    var identifier: String = "YellowCell"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = SnappingFlowLayout()
        
        DispatchQueue.main.async {
            self.store.connectToAPI() // connect to API
            self.store.refreshMe = self
            
            self.CollectionView.register(UINib.init(nibName: "YellowCell", bundle: nil), forCellWithReuseIdentifier: "YellowCell")
            self.CollectionView.register(UINib.init(nibName: "BlueCell", bundle: nil), forCellWithReuseIdentifier: "BlueCell")
            self.CollectionView.register(UINib.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
            self.CollectionView.register(UINib.init(nibName: "SubscribeCell", bundle: nil), forCellWithReuseIdentifier: "SubscribeCell")
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return store.myList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.row  == 2 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscribeCell", for: indexPath) as? SubscribeCell
            return cell!
            
        } else {
            
            let list = store.myList[indexPath.row]
            
            if store.myList[indexPath.row].selfText != "" {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YellowCell", for: indexPath) as! YellowCell
                
                cell.displayCollectionViewCell(list.title, list.selfText, list.subreddit, list.author, list.createdUTC, list.imageUrl)
                return cell
            } else {
                if store.myList[indexPath.row].imageWidth <= 600 {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueCell", for: indexPath) as! BlueCell
                    
                    cell.displayCollectionViewCell(list.title, list.subreddit, list.author, list.createdUTC, list.imageUrl)
                    return cell
                }  else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
                
                    cell.displayCollectionViewCell(list.title, list.subreddit, list.author, list.createdUTC, list.imageUrl)
                    return cell
                }
            }
            
        }
    }

}

extension CollectionViewController: refreshDelegate  {
    
    func reloadView() {
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }

}



