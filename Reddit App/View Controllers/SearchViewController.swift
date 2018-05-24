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
        searchTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        searchTableView.register(UINib.init(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: "SearchResultCell")
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
            cell.displaySearchResults(list.subRedditIcon, list.displayName, list.subscribers)
        return cell
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
        filterContent(searchText)
//        for x in filteredResults {
//            print(x)
//        }
        self.searchTableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
        print("start -> \(searchActive)")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
        print("end -> \(searchActive)")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        SearchQueryDelegate?.getSearchQuery(subreddit)
        dismissModalView()
    }
    
    func dismissModalView() {
        dismiss(animated: true, completion: nil)
    }
    
}



