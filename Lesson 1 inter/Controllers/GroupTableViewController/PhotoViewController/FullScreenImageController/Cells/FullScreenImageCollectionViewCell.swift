//
//  FullScreenImageCollectionViewCell.swift
//  Lesson 1 inter
//
//  Created by Арген on 21.05.2021.
//

import UIKit

class FullScreenImageCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    @IBOutlet weak var fullScreenImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollView.delegate = self
        
        //Minimal'nyi zoom
        self.scrollView.minimumZoomScale = 1.0
        //Maximal'nyi zoom
        self.scrollView.maximumZoomScale = 3.0
    }
    
    func config(_ image: UIImage) {
        fullScreenImageView.image = image
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return fullScreenImageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        //Zoom bolgondon kiyin surot kalybyna keluu
        scrollView.zoomScale = 1.0
    }
}
