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
    
    var cellViews = ["firstCell", "secondCell", "thirdCell", "fourthCell"]

    override func viewDidLoad() {
        super.viewDidLoad()
        DashboardView.delegate = self
        DashboardView.dataSource = self
        DashboardView.collectionViewLayout = SnappingFlowLayout()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellViews[indexPath.item], for: indexPath as IndexPath)
    }
}


