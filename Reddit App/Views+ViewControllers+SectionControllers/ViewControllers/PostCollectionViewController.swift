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

        @IBOutlet weak var postCollectionView: ListCollectionView!
        @IBOutlet weak var noResultLabel: UILabel!
        @IBOutlet weak var loadViewIndicator: UIActivityIndicatorView!
        
        private var postDataDisplay = [PostData]()
        private var subRedditDataDisplay = [SubRedditData]()
        private var subscribeDataDisplay = [SubscribeData]()
        private var postCount = 0
        private var dataList = [ListDiffable]()
        
        private var subreddit: String =  JSONConstants.ParameterValues.SubReddit // default subreddit is iOSProgramming

        lazy var adapter: ListAdapter =  {
            let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 1)
            return adapter
        }()
        
            override func viewDidLoad() {
                super.viewDidLoad()
                
                print("hello")
                postCollectionView.collectionViewLayout = SnappingFlowLayout()
                adapter.collectionView = postCollectionView
                adapter.dataSource = self
                
                postDataPresenter?.attachPostDataView(self, self)
                postDataPresenter?.getPostData(subreddit)
            }

    
            @IBAction func searchButton(_ sender: Any) {
                performSegue(withIdentifier: "searchForm", sender: nil)
            }
    
    
            override func viewDidLayoutSubviews() {
                super.viewDidLayoutSubviews()
                postCollectionView.frame = view.bounds
            }
    
    
        /** MARK: compilation of all data for display **/
            private func setListOfData(_ postData: [PostData], _ subscribeDataDisplay: [SubscribeData]) -> [ListDiffable] {
                var data: [ListDiffable] = []
                
                    var i = 0
                    while i < self.postCount {
                        if i % 4 == 0 && i != 0 {
                            data.append(self.subscribeDataDisplay[i])
                        } else {
                            data.append(self.postDataDisplay[i])
                        }
                        
                        i = i + 1
                    }
                return data
            }
        
    }


/** MARK: source PostDataSource **/
    extension PostCollectionViewController: ListAdapterDataSource {

        func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
            let items: [ListDiffable] = dataList
            return items
        }

        func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
            if object is PostData {
                return PostSectionController()
            }
            else {
                return SubscribeSectionController()
            }
        }

        func emptyView(for listAdapter: ListAdapter) -> UIView? {
            return nil
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
                self.postCount = postData.count
                self.noResultLabel.isHidden = true
                self.postCollectionView.isHidden = false
                self.adapter.performUpdates(animated: true, completion: nil)
            }
        }
        
        func emptyPostData(_ errorMessage: String) {
            performUIUpdatesOnMain {
                self.noResultLabel.isHidden = false
                self.postCollectionView.isHidden = true
                self.noResultLabel.text = errorMessage
                self.adapter.performUpdates(animated: true, completion: nil)
            }
        }

    }


/** MARK: delegate SubscribeDataView **/
    extension PostCollectionViewController: SubscribeDataView {
        
        func setSubRedditData(_ subRedditData: [SubRedditData]) {
            subRedditDataDisplay = subRedditData
            for x in 0..<10{
                subscribeDataDisplay.append(SubscribeData(subRedditDataDisplay[x], subRedditDataDisplay[x+1], subRedditDataDisplay[x+2]))
            }
            dataList = setListOfData(postDataDisplay, subscribeDataDisplay) // set listData object
            self.adapter.performUpdates(animated: true, completion: nil)
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

