//
//  CollectionViewController.swift
//  Main view controller of app (the Dashboard)
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

class PostCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var NoResultLabel: UILabel!
    @IBOutlet weak var LoadViewIndicator: UIActivityIndicatorView!
    
    var subreddit: String =  JSONConstants.ParameterValues.SubReddit // default subreddit is iOSProgramming
    
    let store = JSONDataStore.sharedInstance
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
        
        postCollectionView.collectionViewLayout = SnappingFlowLayout()
        
        self.postCollectionView.register(UINib.init(nibName: "YellowCell", bundle: nil), forCellWithReuseIdentifier: "YellowCell")
        self.postCollectionView.register(UINib.init(nibName: "BlueCell", bundle: nil), forCellWithReuseIdentifier: "BlueCell")
        self.postCollectionView.register(UINib.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        self.postCollectionView.register(UINib.init(nibName: "SubscribeCell", bundle: nil), forCellWithReuseIdentifier: "SubscribeCell")
        
        load(false)
        
    }
    

    func load(_ shouldTableEmpty: Bool) {
        performUIUpdatesOnMain {
            self.store.finishMe = self
            self.store.refreshMe = self
            self.store.connectToAPI(self.subreddit, shouldTableEmpty) // connect to API
        }
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "searchForm", sender: nil)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return store.myPostList.count / 5
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.row  == 4 { // display subscription cells
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscribeCell", for: indexPath) as! SubscribeCell
            var list = store.mySubRedditList[0]
                cell.setSubscribeCellOne(list.subRedditIcon, list.displayName, list.subscribers, list.publicDescription)
            list = store.mySubRedditList[1]
                cell.setSubscribeCellTwo(list.subRedditIcon, list.displayName, list.subscribers, list.publicDescription)
            list = store.mySubRedditList[2]
                cell.setSubscribeCellThree(list.subRedditIcon, list.displayName, list.subscribers, list.publicDescription, list.bannerImage)
            return cell
        } else { // display post cells
            
            let list = store.myPostList[indexPath.row]

            if list.selfText != "" {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YellowCell", for: indexPath) as! PostDataCells
                    cell.setYellowCell(list.title, list.selfText, list.subreddit, list.author, list.createdUTC, list.imageUrl)
                return cell
            } else {
                if list.imageWidth <= 600 {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueCell", for: indexPath) as! PostDataCells
                        cell.setBlueCell(list.title, list.subreddit, list.author, list.createdUTC, list.imageUrl)
                    return cell
                }  else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! PostDataCells
                        cell.setImageCell(list.title, list.subreddit, list.author, list.createdUTC, list.imageUrl)
                    return cell
                }
                
            }
        }
        
    }
    
    
}

extension PostCollectionViewController: RefreshDelegate, SearchViewControllerDelegate {
    
    func reloadView() {
        performUIUpdatesOnMain {
            self.postCollectionView.reloadData()
            if self.store.myPostList.isEmpty { // if no subreddit found, show no result.
                self.NoResultLabel.isHidden = false
                self.postCollectionView.isHidden = true
            } else { // if there are results for subreddit, show all cells
                self.NoResultLabel.isHidden = true
                self.postCollectionView.isHidden = false
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


