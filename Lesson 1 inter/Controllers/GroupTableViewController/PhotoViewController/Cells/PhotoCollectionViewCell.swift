//
//  PhotoCollectionViewCell.swift
//  Lesson 1 inter
//
//  Created by Арген on 17.05.2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageGallery: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(image: UIImage) {
        imageGallery.image = image
        
    }
    
}
