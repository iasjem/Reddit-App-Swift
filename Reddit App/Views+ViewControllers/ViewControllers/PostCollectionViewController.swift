//
//  CollectionViewController.swift
//  Main view controller of app (the Dashboard)
//i
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import IGListKit

/** MARK: viewcontroller PostCollectionViewController **/
    class PostCollectionViewController: UIViewController { 
        
        var postDataPresenter: PostDataPresenter?

        @IBOutlet weak var postCollectionView: UICollectionView!
        @IBOutlet weak var noResultLabel: UILabel!
        @IBOutlet weak var loadViewIndicator: UIActivityIndicatorView!
        
        var postDataDisplay = [PostData]()
        var subRedditDataDisplay = [SubRedditData]()
      
        var subreddit: String =  JSONConstants.ParameterValues.SubReddit // default subreddit is iOSProgramming
        
        lazy var adapter: ListAdapter =  {
            let updater = ListAdapterUpdater()
            let adapter = ListAdapter(updater: updater,
                                      viewController: self,
                                      workingRangeSize: 1)
            adapter.collectionView = postCollectionView
            adapter.dataSource = SuperHeroDatasource()
            return adapter
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            postCollectionView.delegate = self
            postCollectionView.dataSource = self
            postCollectionView.collectionViewLayout = SnappingFlowLayout()
            
            self.postCollectionView.register(UINib.init(nibName: "YellowCell", bundle: nil), forCellWithReuseIdentifier: "YellowCell")
            self.postCollectionView.register(UINib.init(nibName: "BlueCell", bundle: nil), forCellWithReuseIdentifier: "BlueCell")
            self.postCollectionView.register(UINib.init(nibName: "ImageCell", bundle: nil), forCellWithReuseIdentifier: "ImageCell")
            self.postCollectionView.register(UINib.init(nibName: "SubscribeCell", bundle: nil), forCellWithReuseIdentifier: "SubscribeCell")
            
            
            postDataPresenter?.attachPostDataView(self, self)
            postDataPresenter?.getPostData(subreddit)
        }
        
        
        @IBAction func searchButton(_ sender: Any) {
            performSegue(withIdentifier: "searchForm", sender: nil)
        }
        
    }


/** MARK: delegate UICollectionViewDelegate **/
    extension PostCollectionViewController: UICollectionViewDelegate {
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.row  == 4 { // display subscription cells
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubscribeCell", for: indexPath) as! SubscribeCell
                
                var list = subRedditDataDisplay[0]
                
                    cell.firstDisplayName.text = list.displayName
                    cell.firstPublicDescription.text = list.publicDescription
                
                    getSubscriberCount(list.subscribers, cell: cell.firstSubscribersCount) // Please see Globals swift file to see function
                    getImageURL(list.subRedditIcon, cell: cell.firstSubRedditIcon)
                
                
                list = subRedditDataDisplay[1]
                
                    cell.secondDisplayName.text = list.displayName
                    cell.secondPublicDescription.text = list.publicDescription
                
                    getSubscriberCount(list.subscribers, cell: cell.secondSubscribersCount) // Please see Globals swift file to see function
                    getImageURL(list.subRedditIcon, cell: cell.secondSubRedditIcon)
                
                
                list = subRedditDataDisplay[2]
                
                    cell.thirdDisplayName.text = list.displayName
                    cell.thirdPublicDescription.text = list.publicDescription
                
                    getSubscriberCount(list.subscribers, cell: cell.thirdSubscribersCount) // Please see Globals swift file to see function
                    getImageURL(list.subRedditIcon, cell: cell.thirdSubRedditIcon)
                    getImageURL(list.bannerImage, cell: cell.thirdBannerImage)
                
                return cell
                
            } else { // display post cells
                
                
                let list = postDataDisplay[indexPath.row]
                
                if list.selfText != "" {
                    
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "YellowCell", for: indexPath) as! PostDataCells
                    
                        cell.yellowCellPostTitle.text = list.title
                        cell.yellowCellSubReddit.text = list.subreddit
                        cell.yellowCellPostAuthor.text = list.author
                        cell.yellowCellPostTime.text = list.createdUTC
                        cell.yellowCellPostText.text = list.selfText
                    
                        getImageURL(list.imageURL, cell: cell.yellowCellPostImage) // Please see Globals swift file to see function
                    
                    return cell
                    
                } else {
                    
                    if list.imageWidth <= 600 {
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueCell", for: indexPath) as! PostDataCells
                        
                            cell.blueCellPostTitle.text = list.title
                            cell.blueCellSubReddit.text = list.subreddit
                            cell.blueCellPostAuthor.text = list.author
                            cell.blueCellPostTime.text = list.createdUTC
                        
                            getImageURL(list.imageURL, cell: cell.blueCellPostImage) // Please see Globals swift file to see function
                        
                        return cell
                        
                    }  else {
                        
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! PostDataCells
                        
                            cell.imageCellPostTitle.text = list.title
                            cell.imageCellSubReddit.text = list.subreddit
                            cell.imageCellPostAuthor.text = list.author
                            cell.imageCellPostTime.text = list.createdUTC
                        
                            getImageURL(list.imageURL, cell: cell.imageCellPostImage) // Please see Globals swift file to see functionL)
                        
                        return cell
                        
                    }
                }
            }
        }
        
    }


/** MARK: delegate UICollectionViewDataSource **/
    extension PostCollectionViewController: UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return postDataDisplay.count
        }
        
    }


/** MARK: delegate PostDataView **/
    extension PostCollectionViewController: PostDataView {
     
        func startLoading() {
            self.postCollectionView.isHidden = true
            loadViewIndicator.startAnimating()
            print("loading data...")
        }
        
        func finishLoading() {
            loadViewIndicator.stopAnimating()
            print("finished loading!")
        }
        
        func setPostData(_ postData: [PostData]) {
            performUIUpdatesOnMain {
                self.postDataDisplay = postData
                self.noResultLabel.isHidden = true
                self.postCollectionView.isHidden = false
                self.postCollectionView.reloadData()
            }
        }
        
        func emptyPostData(_ errorMessage: String) {
            performUIUpdatesOnMain {
                self.noResultLabel.isHidden = false
                self.postCollectionView.isHidden = true
                self.noResultLabel.text = errorMessage
            }
        }

    }


/** MARK: delegate SubscribeDataView **/
    extension PostCollectionViewController: SubscribeDataView {
        
        func setSubRedditData(_ subRedditData: [SubRedditData]) {
            subRedditDataDisplay = subRedditData
        }
        
    }


/** MARK: delegate SearchViewControllerDelegate **/
    extension PostCollectionViewController: SearchViewControllerDelegate {

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
                self.postDataPresenter?.getPostData(subreddit)
        }
        
        func setSubReddit(_ subreddit:String) -> String{
            return subreddit
        }
        
    }

