//
//  ViewController.swift
//  testAppUnsplash
//
//  Created by fedot on 12.01.2022.
//

import UIKit

class ViewController: UIViewController {
    private let identifier = "cell"
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createCollectionView()
    }
    
    func createCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.sectionInsetReference = .fromSafeArea
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 123, height: 150)

        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        
        view.addSubview(collectionView)
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CollectionViewCell
        cell?.backgroundColor = .brown
        cell?.createCell()
        return cell!
    }
    
    
}
