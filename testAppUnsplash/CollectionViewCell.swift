//
//  CollectionViewCell.swift
//  testAppUnsplash
//
//  Created by fedot on 12.01.2022.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    let image = UIImageView()
    let label = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func createCell() {
        label.text = "asd"
    }

}
