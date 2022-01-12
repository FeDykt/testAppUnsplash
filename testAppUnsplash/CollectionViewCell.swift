//
//  CollectionViewCell.swift
//  testAppUnsplash
//
//  Created by fedot on 12.01.2022.
//

import Foundation
import UIKit
import UnsplashPhotoPicker

class CollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let label = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
   

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
    }
    
    public func createCell(_ photo: UnsplashPhoto) {
        
        guard let imageUrl = photo.urls[.thumb] else { return }
        let imgData = try! Data(contentsOf: imageUrl)
        let image = UIImage(data: imgData)
            imageView.image = image
            
    }
    
}
