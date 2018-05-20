//
//  CollectionViewController.swift
//  Main view controller of app (the Dashboard)
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

private let identifier = "YellowCell"

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    let store = JSONDataStore.sharedInstance
    
   
    
     weak var identifyMe: getIdentifier?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = SnappingFlowLayout()
        
        CollectionView.register(UINib.init(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    
        DispatchQueue.main.async {
            self.store.connectToAPI() // connect to API
            self.store.refreshMe = self
        }
    

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return store.myList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell

        let list = store.myList[indexPath.row]
        
//        identifyMe?.isEmptySelfText(indexPath)
        
        cell.displayCollectionViewCell(identifier, list.title, list.selfText, list.subreddit, list.author, list.createdUTC, list.imageUrl)

        return cell
    }

}

extension CollectionViewController: refreshDelegate, getIdentifier { 
    
    func reloadView() {
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
        }
    }
    
    func isEmptySelfText (_ indexPath: IndexPath) {
        let condition = store.myList[indexPath.row].getSelfText() != "" ? true : false
        
    }

}

