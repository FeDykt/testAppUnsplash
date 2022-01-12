//
//  ViewController.swift
//  testAppUnsplash
//
//  Created by fedot on 12.01.2022.
//

import UIKit
import UnsplashPhotoPicker

enum SelectionType: Int {
    case single
    case multiple
}

class ViewController: UIViewController {
    private let identifier = "cell"
    private var photos = [UnsplashPhoto]()
    
    let network = DecodeToModel()
    var textField = UITextField()
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        createCollectionView()
        getRequest()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search photo", style: .done, target: self, action: #selector(showAlert))
        
    }
    
    func getRequest() {
        network.getUsers { result in
            switch result {
            case .success(let success):
                self.photos = success
                self.collectionView.reloadData()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
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
    
    @objc func showAlert() {
        let alert = UIAlertController(title: "Search photo", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            self.textField = textField
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let actionOk = UIAlertAction(title: "Search", style: .default) { action in
            self.buttonAction()
        }
        alert.addAction(cancel)
        alert.addAction(actionOk)
        
        present(alert, animated: true, completion: nil)
    }
    
    func buttonAction() {
        let allowsMultipleSelection = SelectionType.multiple.rawValue
        let configuration = UnsplashPhotoPickerConfiguration(
            accessKey: "XKM_v1wPvif7JnLzYihma-KBkKuFvZf9IDC08_lziV0",
            secretKey: "XKM_v1wPvif7JnLzYihma-KBkKuFvZf9IDC08_lziV0",
            query: textField.text,
            allowsMultipleSelection: (allowsMultipleSelection != 0)
        )
        let unsplashPhotoPicker = UnsplashPhotoPicker(configuration: configuration)
        unsplashPhotoPicker.photoPickerDelegate = self

        present(unsplashPhotoPicker, animated: true, completion: nil)
    }


}

// MARK: - UnsplashPhotoPickerDelegate
extension ViewController: UnsplashPhotoPickerDelegate {
    func unsplashPhotoPicker(_ photoPicker: UnsplashPhotoPicker, didSelectPhotos photos: [UnsplashPhoto]) {
        print("Unsplash photo picker did select \(photos.count) photo(s)")

        self.photos = photos

        collectionView.reloadData()
    }

    func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker) {
        print("Unsplash photo picker did cancel")
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CollectionViewCell
        
        let photo = photos[indexPath.row]
        cell?.createCell(photo)
        return cell!
    }
    
    
}
