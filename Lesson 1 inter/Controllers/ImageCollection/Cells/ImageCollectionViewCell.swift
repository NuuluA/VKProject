//
//  ImageCollectionViewCell.swift
//  Lesson 1 inter
//
//  Created by Арген on 18.04.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var animatView: UIView!
    
    var like = true
        
    var saveImage: UIImage?

    func clear() {
        imageCell.image = nil
        saveImage = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCell.layer.cornerRadius = 2.5
        animatView.layer.cornerRadius = 2.5
        
        clear()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(imageAnimation(_ :)))
        imageCell.isUserInteractionEnabled = true
        imageCell.addGestureRecognizer(recognizer)
        
    }
    
    override func prepareForReuse() {
        clear()
    }
    
    func configure(image: UIImage) {
        imageCell.image = image
        saveImage = image
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        action()
        
//        UIView.animate(withDuration: 0.5,
//                       delay: 1,
//                       options: [],
//                       animations: {[weak self] in
//                        self?.countLabel.frame.origin = CGPoint(x: 0, y: 0)
//
//                       },
//                       completion: nil)
        
        let width = contentView.bounds.width
        countLabel.transform = CGAffineTransform(translationX: width, y: width)
        UIView.animate(withDuration: 1,
                       delay: 1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: [.preferredFramesPerSecond60],
                       animations: {[weak self] in
                        self?.countLabel.transform = .identity
                       },
                       completion: nil)
    }
    
    func action() {
        if like {
            countLabel.text = "1"
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = UIColor.systemRed
        } else {
            countLabel.text = "0"
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = UIColor.black
        }
        
        like = !like
        
    }
    
    @objc func imageAnimation(_ sender: UITapGestureRecognizer) {
        
        let originFrame = CGRect(x: 0, y: 0, width: self.imageCell.frame.width, height: self.imageCell.frame.height)
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [],
                       animations: {[weak self] in
                        self?.imageCell.layer.bounds = CGRect(x: 0, y: 0, width: 5, height: 5)
                        self?.animatView.alpha = 0.2

                       },
                       completion: {[weak self] _ in
                       
                        UIView.animate(withDuration: 1,
                                       animations: {[weak self] in
                                        self?.imageCell.layer.bounds = originFrame
                                        self?.animatView.alpha = 1
                                       })})    
        
//        let anime = CASpringAnimation(keyPath: "transform.scale")
//        anime.damping = 5
//        anime.fromValue = 0.5
//        anime.toValue = 1
//        anime.stiffness = 400
//        anime.mass = 2
//        anime.duration = 2
//        anime.beginTime = CACurrentMediaTime() + 0
//        anime.fillMode = CAMediaTimingFillMode.removed
//        imageCell.layer.add(anime, forKey: nil)
        
    }
    
    
}







