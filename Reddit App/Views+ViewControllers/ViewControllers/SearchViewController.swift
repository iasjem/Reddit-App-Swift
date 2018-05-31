//
//  SearchViewController.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 22/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit


protocol SearchViewControllerDelegate: class {
    func getSearchQuery(_ searchQuery: String)
}


class SearchViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    fileprivate let searchResultsPresenter = SearchResultDataPresenter(subRedditDataRepository: SubRedditDataRepository())
    
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    @IBOutlet weak var NoResultLabel: UILabel!
    @IBOutlet weak var LoadViewIndicator: UIActivityIndicatorView!
    
    weak var SearchQueryDelegate: SearchViewControllerDelegate?
    
    var subreddit: String = ""
    var searchResultDisplay = [SubRedditData]()
    var filteredResults = [SubRedditData]()
    var searchActive = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchBar.delegate = self
        
        tapGestureOnTable()
        searchTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        searchTableView.register(UINib.init(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: "SearchResultCell")
        
        searchResultsPresenter.attachSubRedditDataView(self)
        searchResultsPresenter.getSearchResults()

    }
    
    
    
    /** MARK: For Table View functionalities **/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isFilterActive() {
            return filteredResults.count
        }
       
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell") as! SearchResultCell
        
        let list: SubRedditData
        
            if isFilterActive() {
                list = filteredResults[indexPath.row]
            } else {
                list = searchResultDisplay[indexPath.row]
            }
        
            cell.SubRedditName.text = list.displayNamePrefixed
            getSubscriberCount(list.subscribers, cell: cell.SubscribersCount) // Please see Globals swift file to see function
            getImageURL(list.subRedditIcon, cell: cell.SubRedditIcon)
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        subreddit = filteredResults[indexPath.row].displayName
        SearchQueryDelegate?.getSearchQuery(subreddit)
        dismissModalView()
    }
    
    
    
    /** MARK: For Search Bar functionalities **/
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismissModalView()
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        subreddit = searchText
        startLoading()
        
            let delayTime = DispatchTime.now() + Double(Int64(1.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
            DispatchQueue.main.asyncAfter(deadline: delayTime) {
                self.finishLoading()
                self.filterContent(self.subreddit)
                self.searchTableView.reloadData()
            }
        

    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchQueryDelegate?.getSearchQuery(subreddit)
        dismissModalView()
    }
    
    
    
    /** MARK: For other functionalities useful for search filtering and modal view dismissal **/
    func tapGestureOnTable() {
        let tapUIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: searchTableView.frame.height))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissModalView))
        tapUIView.addGestureRecognizer(tapGesture)
        searchTableView.tableFooterView = tapUIView
    }
    
    
    func isSearchBarTextEmpty () -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    
    func isFilterActive() -> Bool {
        return !isSearchBarTextEmpty()
    }
    
    
    func filterContent(_ searchText: String) {
        filteredResults = searchResultDisplay.filter({ (sub: SubRedditData) -> Bool in
            return sub.displayName.lowercased().contains(searchText.lowercased())
        })
        
    }
    
    
    @objc func dismissModalView() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SearchViewController: SearchResultDataView { 
    
    func startLoading() {
        LoadViewIndicator.startAnimating()
        print("loading data...")
    }
    
    func finishLoading() {
        LoadViewIndicator.stopAnimating()
        print("finished loading!")
    }
    
    func emptySubRedditData(_ errMessage: String) {
        NoResultLabel.isHidden = false
        searchTableView.isHidden = true
        NoResultLabel.text = errMessage
    }
    
    func setSubRedditData(_ subRedditData: [SubRedditData]) {
        searchResultDisplay = subRedditData
        NoResultLabel.isHidden = true
        searchTableView.isHidden = false
         self.searchTableView.reloadData()
    }
}


