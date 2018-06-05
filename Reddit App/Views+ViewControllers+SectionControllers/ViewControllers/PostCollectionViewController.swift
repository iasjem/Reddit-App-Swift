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
        
        var postDataDisplay = [PostData]()
        var subRedditDataDisplay = [SubRedditData]()
      
        var subreddit: String =  JSONConstants.ParameterValues.SubReddit // default subreddit is iOSProgramming

        lazy var adapter: ListAdapter =  {
            let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 1)
            return adapter
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            postCollectionView.collectionViewLayout = SnappingFlowLayout()

            postDataPresenter?.attachPostDataView(self, self)
            postDataPresenter?.getPostData(subreddit)
            
            adapter.collectionView = postCollectionView
            adapter.dataSource = self
            
        }
        
        
        @IBAction func searchButton(_ sender: Any) {
            performSegue(withIdentifier: "searchForm", sender: nil)
        }
        
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            postCollectionView.frame = view.bounds
        }
        
    }


/** MARK: source PostDataSource **/
    extension PostCollectionViewController: ListAdapterDataSource {

        func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
            var items: [ListDiffable] = postDataDisplay as [ListDiffable]
            items += subRedditDataDisplay as [ListDiffable]

            return items
    
        }

        func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
            if object is PostData {
                return PostSectionController()
            }
            else {
                return SubRedditSectionController()
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

