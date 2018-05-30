//
//  CollectionViewController.swift
//  Main view controller of app (the Dashboard)
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit


class PostCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    fileprivate let postDataPresenter = PostDataPresenter(postDataRepository: PostDataRepository(), subRedditDataRepository: SubRedditDataRepository())

    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var NoResultLabel: UILabel!
    @IBOutlet weak var LoadViewIndicator: UIActivityIndicatorView!
    
    var postDataDisplay = [PostData]()
    var subRedditDataDisplay = [SubRedditData]()
    
    var subreddit: String =  JSONConstants.ParameterValues.SubReddit // default subreddit is iOSProgramming
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postCollectionView.delegate = self
        postCollectionView.dataSource = self
        postCollectionView.collectionViewLayout = SnappingFlowLayout()

        self.postCollectionView.register(UINib.init(nibName: "YellowCell", bundle: nil), forCellWithReuseIdentifier: "YellowCell")
        self.postCollectionView.register(UINib.init(nibName: "BlueCell", bundle: nil), forCellWithReuseIdentifier: "BlueCell")
        self.postCollectionView.register(UINib.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
        self.postCollectionView.register(UINib.init(nibName: "SubscribeCell", bundle: nil), forCellWithReuseIdentifier: "SubscribeCell")
        
        postDataPresenter.attachPostDataView(self, self)
         self.postDataPresenter.getPostData()
        
    }
    
    
    @IBAction func searchButton(_ sender: Any) {
        performSegue(withIdentifier: "searchForm", sender: nil)
    }
    
    
    
    /** MARK: For collection view functionalities **/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postDataDisplay.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row  == 4 { // display subscription cells

           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscribeCell", for: indexPath) as! SubscribeCell

                var list = subRedditDataDisplay[0]
                    cell.DisplayNameOne.text = list.displayName
                    cell.PublicDescriptionOne.text = list.publicDescription
                    getSubscriberCount(list.subscribers, cell: cell.SubscribeCountOne) // Please see Globals swift file to see function
                    getImageURL(list.subRedditIcon, cell: cell.SubRedditIconOne)
                list = subRedditDataDisplay[1]
                    cell.DisplayNameTwo.text = list.displayName
                    cell.PublicDescriptionTwo.text = list.publicDescription
                    getSubscriberCount(list.subscribers, cell: cell.SubscribeCountTwo) // Please see Globals swift file to see function
                    getImageURL(list.subRedditIcon, cell: cell.SubRedditIconTwo)
                list = subRedditDataDisplay[2]
                    cell.DisplayNameThree.text = list.displayName
                    cell.PublicDescriptionThree.text = list.publicDescription
                    getSubscriberCount(list.subscribers, cell: cell.SubscribeCountThree) // Please see Globals swift file to see function
                    getImageURL(list.subRedditIcon, cell: cell.SubRedditIconThree)
                    getImageURL(list.bannerImage, cell: cell.BannerImageThree)
            
            return cell

        } else { // display post cells
//
                let list = postDataDisplay[indexPath.row]

                if list.selfText != "" {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YellowCell", for: indexPath) as! PostDataCells
                        cell.YellowCellPostTitle.text = list.title
                        cell.YellowCellSubReddit.text = list.subreddit
                        cell.YellowCellPostAuthor.text = list.author
                        cell.YellowCellPostTime.text = list.createdUTC
                        cell.YellowCellPostText.text = list.selfText
                        getImageURL(list.imageURL, cell: cell.YellowCellPostImage) // Please see Globals swift file to see function
                    return cell
                } else {
                    if list.imageWidth <= 600 {
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueCell", for: indexPath) as! PostDataCells
                            cell.BlueCellPostTitle.text = list.title
                            cell.BlueCellSubReddit.text = list.subreddit
                            cell.BlueCellPostAuthor.text = list.author
                            cell.BlueCellPostTime.text = list.createdUTC
                            getImageURL(list.imageURL, cell: cell.BlueCellPostImage) // Please see Globals swift file to see function
                        return cell
                    }  else {
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! PostDataCells
                            cell.ImageCellPostTitle.text = list.title
                            cell.ImageCellSubReddit.text = list.subreddit
                            cell.ImageCellPostAuthor.text = list.author
                            cell.ImageCellPostTime.text = list.createdUTC
                            getImageURL(list.imageURL, cell: cell.ImageCellPostImage) // Please see Globals swift file to see functionL)
                        return cell
                    }
                }
        }
    }
}


extension PostCollectionViewController: PostDataView, SubscribeDataView {
 
    func startLoading() {
        LoadViewIndicator.startAnimating()
        print("loading data...")
    }
    
    func finishLoading() {
        LoadViewIndicator.stopAnimating()
        print("finished loading!")
    }
    
    func setPostData(_ postdata: [PostData]) {
        postDataDisplay = postdata
        NoResultLabel.isHidden = true
        postCollectionView.isHidden = false
        postCollectionView.reloadData()
    }
    
    func emptyPostData(_ errMessage: String) {
        NoResultLabel.isHidden = false
        postCollectionView.isHidden = true
        NoResultLabel.text = errMessage
    }
    
    func setSubRedditData(_ subRedditData: [SubRedditData]) {
        subRedditDataDisplay = subRedditData
    }
    
}

///** MARK: For additional delegations regarding Post Colleciton View **/
//extension PostCollectionViewController: SearchViewControllerDelegate {
//
//
//
////    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
////        if segue.identifier == "searchSegue" {
////
////            if let searchViewContoller = segue.destination as? SearchViewController {
////                searchViewContoller.SearchQueryDelegate = self
////            }
////
////        }
////    }
////
//
////     func getSearchQuery(_ searchQuery: String) {
////        var query = searchQuery
////
////        if query.isEmpty { // if entered search query is empty, set to current subreddit
////            query = subreddit
////        }
////
////        subreddit = query
////    }
//
//
//}


