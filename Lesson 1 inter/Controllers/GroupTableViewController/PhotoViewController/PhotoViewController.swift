//
//  PhotoViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 17.05.2021.
//

import UIKit

class PhotoViewController: UIViewController {

    let identifierID = "fullImage"
    var group: Group?
    var fotoArray = [UIImage]()
    let countCell: CGFloat = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifierID)
        
        guard let _ = group,
              let array = group?.imageGallery else {return}
        fotoArray = array
    }
    
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return fotoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierID, for: indexPath) as! PhotoCollectionViewCell
        cell.configure(image: fotoArray[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let framCV = UIScreen.main.bounds//collectionView.frame
        let widthCell = framCV.width / countCell
        let heightCell = widthCell

        return CGSize(width: widthCell, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "FullScreenImageViewController") as! FullScreenImageViewController
        vc.fullScreenImage = group
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
 
}
