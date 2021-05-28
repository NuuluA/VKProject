//
//  NewsViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 27.04.2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class NewsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    let identifierID = "NewsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "NewsCell", bundle: nil), forCellWithReuseIdentifier: identifierID)

        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Ekrandyn razmerin belgilesh u4un
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
    }
 
}

extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierID, for: indexPath) as? NewsCell {
            
            cell.news = newsArray[indexPath.item]
            return cell
        }
        return NewsCell()
    }
    
    //Razmer mejdu 94eek
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
//    Razmer kartinki
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 400)
    }
    
}




