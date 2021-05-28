//
//  ImageCollectionViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 18.04.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class ImageCollectionViewController: UICollectionViewController {
    
    var users: User?
    var fotoArray = [UIImage]()  //massiv fotonu "fotoArray"ge ozdoshturobuz
    let countCell: CGFloat = 2
    
    let imageControllerReuse = "ImageCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        self.collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: imageControllerReuse)

        guard let _ = users,
              let array = users?.fotoArray else {
            return
        }
        fotoArray = array
    }

    // MARK: UICollectionViewDataSource
     
     
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fotoArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageControllerReuse, for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        cell.configure(image: fotoArray[indexPath.item])
    
        return cell
    }

}

extension ImageCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

//        return CGSize(width: UIScreen.main.bounds.width/2.1, height: UIScreen.main.bounds.height/4)
        let framCV = UIScreen.main.bounds//collectionView.frame
        let widthCell = framCV.width / countCell
        let heightCell = widthCell

        return CGSize(width: widthCell - 5, height: heightCell)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }    
}
