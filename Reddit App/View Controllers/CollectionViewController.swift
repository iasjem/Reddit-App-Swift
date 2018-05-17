//
//  MainViewController.swift
//  Reddit App
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var randomIndex = 0
    var myDate = MyDate()
    var cellCount = 0
    var cellViews = ["firstCell", "secondCell", "thirdCell", "fourthCell"]
    var redditData = RedditData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.collectionViewLayout = SnappingFlowLayout()
        CollectionView.contentInset = UIEdgeInsetsMake(0.0,0.0,75.0,0.0);
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let identifier = cellViews[indexPath.item]
        let identifier = "firstCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewCell

        let session = URLSession.shared
        let url = URL(string: "\(Constants.Source.APIBaseURL)\(Constants.ParameterValues.SubReddit)")!
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            func displayError(_ error: String) { print(error) }
            
            guard (error == nil) else {
                displayError("URL at time of error: \(url)")
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                displayError("Your request returned a status code other than 2xx!")
                return
            }
            
            guard let data = data else {
                displayError("No data was returned by the request!")
                return
            }
            
            let parsedResult: [String:AnyObject]!
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:AnyObject]
            } catch {
                displayError("Could not parse the data as JSON: '\(data)'")
                return
            }
            
            if let data = parsedResult[Constants.ResponseKeys.Data] as? [String:AnyObject], let children = data[Constants.ResponseKeys.Children] as? [[String:AnyObject]]  {
                
                self.randomIndex = Int(arc4random_uniform(UInt32(children.count)))
                let findChildren = children[self.randomIndex] as [String:AnyObject]
                self.cellCount = children.count
                print(self.cellCount)
                if let moreData = findChildren[Constants.ResponseKeys.Data] as? [String:AnyObject] {
                    performUIUpdatesOnMain {
                        cell.getMyCell(identifier, self.redditData.getImage(moreData), self.redditData.getTitle(moreData), self.redditData.getSelfText(moreData), self.redditData.getSubReddit(moreData), "u/\(self.redditData.getAuthor(moreData))", self.redditData.getCreatedUTC(moreData))
                    }
                }
            }
        }
        task.resume()
        
        return cell
    }
}

