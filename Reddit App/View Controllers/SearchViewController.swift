//
//  SearchViewController.swift
//  RedditApp
//
//  Created by Jemimah Beryl M. Sai on 22/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

protocol SearchViewControllerDelegate: class {
    func getSearchQuery()
}

class SearchViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var searchTableView: UITableView!
    
    weak var QueryMe: SearchViewControllerDelegate?
    
    let store = JSONDataStore.sharedInstance
    var subreddit: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchBar.delegate = self
       
        searchTableView.register(UINib.init(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: "SearchResultCell")
    }
    
    // Filter list items by active and archived tasks
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell") as! SearchResultCell
            let subList = store.mySubList[indexPath.row]
            cell.displaySearchResults(subList.subRedditIcon, subList.displayName, subList.subscribers)
        return cell
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        QueryMe?.getSearchQuery()
        dismissModalView()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        subreddit = searchText
        self.searchTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissModalView()
    }
    
    private func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
    }
    
    private func searchBarTextDidEndEditing(searchBar: UISearchBar) {
    }
    
    private func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    }
    
    private func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    }
    
    func dismissModalView() {
        dismiss(animated: true, completion: nil)
    }
    
}





