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
    
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    weak var SearchQueryDelegate: SearchViewControllerDelegate?
    
    let store = JSONDataStore.sharedInstance
    var subreddit: String = ""
    var filteredResults = [SubRedditData]()
    var searchActive = false
    
    func isSearchBarTextEmpty () -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    func isFilterActive() -> Bool {
        return !isSearchBarTextEmpty()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchBar.delegate = self
         tapGestureOnTable()
        
        searchTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        searchTableView.register(UINib.init(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: "SearchResultCell")
        
    }
    
    func tapGestureOnTable() {
        let tapUIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: view.frame.width, height: searchTableView.frame.height))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissModalView))
        tapUIView.addGestureRecognizer(tapGesture)
        searchTableView.tableFooterView = tapUIView
    }
    
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
                list = store.mySubList[indexPath.row]
            }
            cell.displaySearchResults(list.subRedditIcon, list.displayNamePrefixed, list.subscribers)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        subreddit = filteredResults[indexPath.row].displayName
        SearchQueryDelegate?.getSearchQuery(subreddit)
        dismissModalView()
    }
    
    func filterContent(_ searchText: String) {
        filteredResults = store.mySubList.filter({ (sub: SubRedditData) -> Bool in
            return sub.displayName.lowercased().contains(searchText.lowercased())
        })
    }
    
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
    
    @objc func dismissModalView() {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}



