//
//  SwipeViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 11.05.2021.
//

import UIKit

class SwipeViewController: UIViewController {
  
    let imageArray = [ #imageLiteral(resourceName: "1_4"), #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "4_3"), #imageLiteral(resourceName: "1_3"), #imageLiteral(resourceName: "van")]
    let interactiveAnimatore: UIViewPropertyAnimator! = nil
    
    var nextIndex = 0
    var currentPicture: UIImageView?
    let originalSize: CGFloat = 380
    var originalHeight: CGFloat = 300
    var isActive = false
    var isLeftSwipe = false
//    var activeSize: CGFloat {
//        return originalSize + 5
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showNextPicture()
    }
    
    func showNextPicture() {
        if let newPicture = creatPicture() {
            currentPicture = newPicture
            showPicture(newPicture)
            
            //Sozdali TapGestureRecognizer
            let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            newPicture.addGestureRecognizer(gesture)
            
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_ :)))
            swipe.direction = .up
            newPicture.addGestureRecognizer(swipe)
            
            let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_ :)))
            pan.delegate = self
            newPicture.addGestureRecognizer(pan)
        } else {
            nextIndex = 0
            showNextPicture()
        }
        
    }
    //Sozdali TapGestureRecognizer
    @objc func handleTap() {
        isActive = !isActive
        
        if isActive {
            activePicture()
        } else {
            deActivePicture()
        }
    }
    
    @objc func handleSwipe(_ swipe: UISwipeGestureRecognizer) {
        guard !isActive else {return}
        hidePicture(currentPicture!)
        showNextPicture()
    }
    
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        guard let view = currentPicture, isActive else {return}
        switch sender.state {
        case .began, .changed:
           pictureMovement(sender: sender, view: view)
        case .ended:
          break
        default:
            break
        }
    }
    
    //Setup Picture
    func creatPicture() -> UIImageView? {
        guard nextIndex < imageArray.count else {return nil}
        let imageView = UIImageView(image: imageArray[nextIndex])
        imageView.frame = CGRect(x: self.view.frame.width, y: self.view.center.y - (originalSize / 3), width: originalSize, height: originalHeight)
        
        //Vklyu4aem activasion
        imageView.isUserInteractionEnabled = true
        
        //Shadow
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10
        
        //Frame
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.layer.borderWidth = 2
        
        nextIndex += 1
        return imageView
    }
    
    func pictureMovement(sender: UIPanGestureRecognizer, view: UIImageView) {
        let translation = sender.translation(in: view)
        self.currentPicture!.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(.zero, in: view)
    }
    
    func activePicture() {
        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            guard let self = self else {return}
            self.currentPicture?.frame.size = CGSize(width: self.originalSize, height: self.originalHeight)
            self.currentPicture?.layer.shadowOpacity = 0.5
            self.currentPicture?.layer.borderColor = UIColor.green.cgColor
        })
    }
    
    func deActivePicture() {
        UIView.animate(withDuration: 0.3, animations: {[weak self] in
            guard let self = self else {return}
            self.currentPicture?.frame.size = CGSize(width: self.originalSize, height: self.originalHeight)
            self.currentPicture?.layer.shadowOpacity = 0
            self.currentPicture?.layer.borderColor = UIColor.darkGray.cgColor
        })
    }
    
    func showPicture(_ imageView: UIImageView) {
        self.view.addSubview(imageView)
        
        UIView.animate(withDuration: 0.3,
                       animations: {
                        imageView.center = self.view.center
                       })
    }
    
    func hidePicture(_ imageView: UIImageView) {
        UIView.animate(withDuration: 0.3,
                       animations: {
                        self.currentPicture?.frame.origin.y = -self.originalSize
                       }) { _ in
            imageView.removeFromSuperview()
        }
    }
    
}

extension SwipeViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
