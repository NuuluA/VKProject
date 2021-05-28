//
//  NewsCell.swift
//  Lesson 1 inter
//
//  Created by Арген on 01.05.2021.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var allImage: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var news: News? {
        didSet {
            if let image = news?.avatar {
                avatarImage.image = UIImage(named: image)
            }
            
            nameLabel.text = news?.textName
            
            if let cellImage = news?.allImage {
                allImage.image = UIImage(named: cellImage)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //MARK: Gradient ekranga
        borderColor()
        shadowView.shadowLayerCorner(cornerRadius: shadowView.frame.width * 0.5, shadowRadius: 6, shadowOffset: CGSize(width: -3, height: 5), shadowColor: .black)
        
        //Sozdaem Recognizer dlya "allImage"
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTapImage(_ :)))
        allImage.addGestureRecognizer(recognizer)
        //Deistviyany jandyruu
        allImage.isUserInteractionEnabled = true
        
        allImage.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
        
    }
     
    //MARK: UIPanGestureRecognizer
    // Eki kaptalga jyla turgan Recognizer
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        
        if gesture.state == .began {
            print("Began")
        } else if gesture.state == .changed {
            let translation = gesture.translation(in: self)
            allImage.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 1,
                           options: .curveEaseIn,
                           animations: {
                            self.allImage.transform = .identity
                           },
                           completion: nil)
        }
    }
    

    //MARK: Function Recognizer
    
    @objc func onTapImage(_ sender: UITapGestureRecognizer) {
        tapToImage()
    }
    
    //MARK: AvatarImage CALayer
    func borderColor() {
        nameLabel.textColor = .black
        avatarImage.layer.borderColor = UIColor.black.cgColor
        avatarImage.layer.borderWidth = 0.5
        avatarImage.layer.cornerRadius = avatarImage.frame.width * 0.5
    }
    
    //MARK: TapToHeart
    @IBAction func pressButton(_ sender: UIButton) {
        tapToImage()
    }
    
    var likeHeart = true
    
    func tapToImage() {
        
        if likeHeart {
            countLabel.text = "1"
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = UIColor.systemRed
        } else {
            countLabel.text = "0"
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = UIColor.black
        }
        
        likeHeart = !likeHeart
    }
}

extension UIView {
    
    func shadowLayerCorner(cornerRadius: CGFloat, shadowOpacity: Float = 1, shadowRadius: CGFloat, shadowOffset: CGSize, shadowColor: UIColor) {
        layer.cornerRadius = cornerRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor.cgColor
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        
    }
}

