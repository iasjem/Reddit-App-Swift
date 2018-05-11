//
//  MainViewController.swift
//  Reddit App
//
//  Created by Jemimah Beryl M. Sai on 10/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var DashboardView: UICollectionView!
    
    var reuseIdentifier = "secondCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DashboardView.delegate = self
        DashboardView.dataSource = self
        DashboardView.collectionViewLayout = SnappingFlowLayout()
    }

    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! DashboardViewCell
                
        return cell
    }

}

