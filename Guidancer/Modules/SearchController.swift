//
//  SearchController.swift
//  Guidancer
//
//  Created by Артём Коротков on 25.11.2022.
//

import UIKit

class SearchController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var horizontalCollectionView: UICollectionView!
    var collectionView1: UICollectionView!
    let searchController = UISearchController()
    let horizontalLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupCollectionViews()
        setupBarButtonItem()
        setupSearch()
        setupHorizontalLayout()

        print("identifier: \(SearchScreenCollectionViewCell.identifier)")
        print("identifier: \(PostCollectionViewCell.identifier)")
    }
    
    @objc private func backSegue() {
        //logic for pop vc
    }
    
    private func setupSearch() {
        //        title = "Popular"
    }
    
    private func setupBarButtonItem() {
        let buttomItem: UIBarButtonItem = {
            let item = UIBarButtonItem()
            item.image = UIImage(systemName: "arrowshape.left")
            item.style = .done
            item.target = self
            item.action = #selector(backSegue)
            item.tintColor = .gBlack
            return item
        }()
        //   title!     navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        navigationItem.leftBarButtonItems = [buttomItem]
    }
    
    private func setupLayout() {
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0 , right: 0)
        layout.itemSize = CGSize(width: 350, height: 200)
    }
    
    private func setupHorizontalLayout() {
        horizontalLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0 , right: 10)
        horizontalLayout.itemSize = CGSize(width: 300, height: 150)
    }
    
    private func setupCollectionViews() {
        view.backgroundColor = .white
        horizontalCollectionView = UICollectionView(
            frame: CGRect(),
            collectionViewLayout: horizontalLayout)
        
        horizontalCollectionView.translatesAutoresizingMaskIntoConstraints = false
        horizontalCollectionView.showsHorizontalScrollIndicator = false
        horizontalLayout.scrollDirection = .horizontal
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.delegate = self
        horizontalCollectionView.register(PostCollectionViewCell.self,
                                          forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        self.view.addSubview(horizontalCollectionView)
        
        
        collectionView1 = UICollectionView(
            frame: CGRect(),
            collectionViewLayout: layout)
        
        collectionView1.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .vertical
        collectionView1.dataSource = self
        collectionView1.delegate = self
        collectionView1.register(SearchScreenCollectionViewCell.self, forCellWithReuseIdentifier: SearchScreenCollectionViewCell.identifier)
        collectionView1.showsVerticalScrollIndicator = false
        self.view.addSubview(collectionView1)
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            horizontalCollectionView.topAnchor.constraint(equalTo: margins.topAnchor),
            horizontalCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: horizontalCollectionView.leadingAnchor),
            collectionView1.topAnchor.constraint(equalTo: horizontalCollectionView.bottomAnchor,constant: 10),
            collectionView1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView1.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 0),
            collectionView1.heightAnchor.constraint(equalToConstant: view.frame.size.height - 370),
            collectionView1.widthAnchor.constraint(equalToConstant: view.frame.width),
            horizontalCollectionView.heightAnchor.constraint(equalToConstant: 170),
            horizontalCollectionView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
        ])
    }
}

extension SearchController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return 10
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchScreenCollectionViewCell.identifier,
                                                          for: indexPath) as! SearchScreenCollectionViewCell
            cell.setupContent(post: .mock)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier,
                                                          for: indexPath) as! PostCollectionViewCell
            cell.setupContent(post: .mock)
            return cell
        }
    }
}
