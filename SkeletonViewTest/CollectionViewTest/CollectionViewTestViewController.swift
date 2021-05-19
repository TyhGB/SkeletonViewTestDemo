//
//  CollectionViewTestViewController.swift
//  SkeletonViewTest
//
//  Created by Tao on 2021/5/19.
//

import UIKit
import SkeletonView

class CollectionViewTestViewController: UIViewController {

    lazy var cLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width-50)/3, height: 125)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.cLayout)
        collection.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(CollectionOneCell.self, forCellWithReuseIdentifier: "secondCell")
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "secondCellDefault")
        return collection
    }()
    
    deinit {
        print("deinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.isSkeletonable = true
        
        collectionView.showAnimatedSkeleton()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.collectionView.hideSkeleton()
        }
    }

}

extension CollectionViewTestViewController: UICollectionViewDelegate, SkeletonCollectionViewDataSource {
    //skeleton
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "secondCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    //collection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath) as? CollectionOneCell {
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCellDefault", for: indexPath)
        return cell
        
    }
    
}
