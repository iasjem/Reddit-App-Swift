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
    @IBOutlet weak var NoResultLabel: UILabel!
    @IBOutlet weak var LoadViewIndicator: UIActivityIndicatorView!
    
    var subreddit: String =  Constants.ParameterValues.SubReddit
    
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "searchForm", sender: nil)
    }
    
    let store = JSONDataStore.sharedInstance
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = SnappingFlowLayout()
        self.CollectionView.register(UINib.init(nibName: "YellowCell", bundle: nil), forCellWithReuseIdentifier: "YellowCell")
        self.CollectionView.register(UINib.init(nibName: "BlueCell", bundle: nil), forCellWithReuseIdentifier: "BlueCell")
        self.CollectionView.register(UINib.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        self.CollectionView.register(UINib.init(nibName: "SubscribeCell", bundle: nil), forCellWithReuseIdentifier: "SubscribeCell")
        
        load(false)
        
    }
    
    func load(_ shouldTableEmpty: Bool) {
        performUIUpdatesOnMain {
            self.store.finishMe = self
            self.store.refreshMe = self
            self.store.connectToAPI(self.subreddit, shouldTableEmpty) // connect to API
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return store.myList.count / 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.row  == 4 { // display subscription cells
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscribeCell", for: indexPath) as! SubscribeCell
            var list = store.mySubList[0]
                cell.displaySubscribeCellOne(list.subRedditIcon, list.displayName, list.subscribers, list.publicDescription)
            list = store.mySubList[1]
                cell.displaySubscribeCellTwo(list.subRedditIcon, list.displayName, list.subscribers, list.publicDescription)
            list = store.mySubList[2]
                cell.displaySubscribeCellThree(list.subRedditIcon, list.displayName, list.subscribers, list.publicDescription, list.bannerImage)
            return cell
        } else { // display post cells
            let list = store.myList[indexPath.row]
            if list.selfText != "" {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YellowCell", for: indexPath) as! YellowCell
                cell.displayCollectionViewCell(list.title, list.selfText, list.subreddit, list.author, list.createdUTC, list.imageUrl)
                return cell
            } else {
                if list.imageWidth <= 600 {
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

extension CollectionViewController: RefreshDelegate, SearchViewControllerDelegate {
    
    func reloadView() {
        performUIUpdatesOnMain {
            self.CollectionView.reloadData()
            if self.store.myList.isEmpty { // if no subreddit found, show no result.
                self.NoResultLabel.isHidden = false
                self.CollectionView.isHidden = true
            } else { // if there are results for subreddit, show all cells
                self.NoResultLabel.isHidden = true
                self.CollectionView.isHidden = false
            }
        }
    }
    
    func isFinishedLoading(_ isFinish: Bool) {
        if isFinish == true {
            LoadViewIndicator.stopAnimating()
            print("finished loading!")
        } else {
            LoadViewIndicator.startAnimating()
            print("loading data...")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchSegue" {
            if let searchViewContoller = segue.destination as? SearchViewController {
                searchViewContoller.SearchQueryDelegate = self
            }
        }
    }
    
     func getSearchQuery(_ searchQuery: String) {
        var query = searchQuery
        
        if query.isEmpty { // if entered search query is empty, set to current subreddit
            query = subreddit 
        }
        
        subreddit = query
        load(true)
    }

}


