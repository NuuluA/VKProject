//
//  FullScreenImageViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 21.05.2021.
//

import UIKit

class FullScreenImageViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var fullScreenImage: Group? = nil
    var fullImageArray = [UIImage]()
    let identifierReuse = "cell"
    var indexPath: IndexPath! = nil
    let countCell: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "FullScreenImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifierReuse)
        
        guard let array = fullScreenImage?.imageGallery else { return}
        fullImageArray = array
        
        collectionView.performBatchUpdates(nil) { result in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }
    }
    
    
}

extension FullScreenImageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fullImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierReuse, for: indexPath) as! FullScreenImageCollectionViewCell
        let image = fullImageArray[indexPath.row]
        cell.config(image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
        let widht = frameCV.width/countCell
        let height = widht
        
        return CGSize(width: widht, height: height)
    }
    
}
