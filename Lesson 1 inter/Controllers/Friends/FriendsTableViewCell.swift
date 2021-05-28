//
//  FriendsTableViewCell.swift
//  Lesson 1 inter
//
//  Created by Арген on 02.05.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var shadowImg: UIView!
    
    var users: User? {
        didSet {
            if let image = users?.avatarImage {
                avatarImg.image = UIImage(named: image)
            }
            nameLbl.text = users?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        radius()
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(animationImage(_ :)))
        avatarImg.addGestureRecognizer(recognizer)
        avatarImg.isUserInteractionEnabled = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func radius() {
        avatarImg.layer.cornerRadius = avatarImg.frame.width * 0.5
        avatarImg.layer.borderColor = UIColor.black.cgColor
        avatarImg.layer.borderWidth = 0.5

        shadowImg.layer.shadowColor = UIColor.black.cgColor
        shadowImg.layer.shadowRadius = 7
        shadowImg.layer.shadowOpacity = 0.8
        shadowImg.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowImg.layer.cornerRadius = shadowImg.frame.width * 0.5
        shadowImg.layer.masksToBounds = false        
       
    }
    
    @objc private func animationImage(_ sender: UITapGestureRecognizer) {
   
        let anime = CASpringAnimation(keyPath: "transform.scale")
        anime.damping = 3
        anime.fromValue = 0.5
        anime.toValue = 1
        anime.stiffness = 400
        anime.mass = 2
        anime.duration = 2
        anime.beginTime = CACurrentMediaTime() + 0
        anime.fillMode = CAMediaTimingFillMode.removed
        shadowImg.layer.add(anime, forKey: nil)
        
//        UIView.animate(withDuration: 1,
//                       delay: 1,
//                       usingSpringWithDamping: 0.5,
//                       initialSpringVelocity: 0,
//                       options: [.autoreverse],
//                       animations: {[weak self] in
//                        self?.avatarImg.transform = .identity
//
//                       },
//                       completion: nil)
    }
    
    
}
