//
//  ViewControllerII.swift
//  Guidancer
//
//  Created by Артём Коротков on 04.11.2022.
//

import UIKit

import UIKit

class ViewControllerII: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    var collectionView: UICollectionView!
    var cellIdentifier = "Cell"
    let padding: CGFloat = 50.0
    
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create an instance of UICollectionViewFlowLayout since you cant
        // Initialize UICollectionView without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0 , right: 0)
        layout.itemSize = CGSize(width: 350, height: 350)
        
        
  
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(collectionView)

    }
}




extension ViewControllerII {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath as IndexPath) as! CollectionViewCell
        return cell
    }
    
}

