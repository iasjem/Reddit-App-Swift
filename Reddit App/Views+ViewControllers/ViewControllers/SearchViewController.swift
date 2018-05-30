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
    
    var searchResultsPresenter: SearchResultDataPresenter!
    
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    weak var SearchQueryDelegate: SearchViewControllerDelegate?
    
    var subreddit: String = ""
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
                list = searchResultsPresenter.searchresultdata[indexPath.row]
            }
            cell.setSearchResultCell(list.subRedditIcon, list.displayNamePrefixed, list.subscribers)
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
        filterContent(subreddit)
        self.searchTableView.reloadData()
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
        filteredResults = searchResultsPresenter.searchresultdata.filter({ (sub: SubRedditData) -> Bool in
            return sub.displayName.lowercased().contains(searchText.lowercased())
        })
    }
    
    
    @objc func dismissModalView() {
        dismiss(animated: true, completion: nil)
    }
    
}



