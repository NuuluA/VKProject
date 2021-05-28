//
//  BackToMainViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 08.04.2021.
//

import UIKit

class BackToMainViewController: UIViewController {
    
    @IBOutlet weak var simpleView: UIView!
    @IBOutlet weak var tokenTF: UITextField!
    @IBOutlet weak var userldTF: UITextField!
    
    let viewController = "ViewController"
    let backToMain = "Welcome back to main screen Argen"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateView()
        
        tokenTF.text = AccountSingleton.shared.token
        userldTF.text = String(AccountSingleton.shared.userLD)
        
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        navigationController?.popToRootViewController(animated: true)
        navigationController?.popViewController(animated: true)
        
    }
    
    func animateView() {
        
        UIView.animateKeyframes(withDuration: 2,
                                delay: 0.20,
                                options: [.repeat, .autoreverse],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0.0,
                                                       relativeDuration: 0.20,
                                                       animations: {[weak self] in
                                                        self?.simpleView.center.x += 100
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.20,
                                                       relativeDuration: 0.20,
                                                       animations: {[weak self] in
                                                        self?.simpleView.center.y += 100
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.5,
                                                       relativeDuration: 0.20,
                                                       animations: {[weak self] in
                                                        self?.simpleView.center.x -= 100
                                                       })
                                    UIView.addKeyframe(withRelativeStartTime: 0.75,
                                                       relativeDuration: 0.20,
                                                       animations: {[weak self] in
                                                        self?.simpleView.center.y -= 100
                                                       })
                                },
                                completion: nil)
    
    }
}
