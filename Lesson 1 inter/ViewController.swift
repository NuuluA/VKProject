//
//  ViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 04.04.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var titleTF: UILabel!
    @IBOutlet weak var firstLbl: UILabel!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var thirdLbl: UILabel!
    
    
    let fromMainToTab = "fromMainToTab"
    let backToMainViewController = "BackToMainViewController"
    let viewControllerID = "ViewControllerID"
    
    override func viewDidAppear(_ animated: Bool) {
        animatTitle()
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        passwordTF.delegate = self
        userNameTF.delegate = self
        snakeAnimation()
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return passwordTF.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Sozdaem action knopku dlya perexoda na drugoi ekran
    @IBAction func pressButton(_ sender: UIButton) {
        
        if self.userNameTF.text == "Gena",
           self.passwordTF.text == "12345" {
            
            performSegue(withIdentifier: fromMainToTab, sender: self)
        }
        
        // Sozdaem UIAlertController controller
        
        let alertContr = UIAlertController(title: "Ошибка", message: "Введены неверные данные пользователя", preferredStyle: UIAlertController.Style.alert)
        
        // Sozdaem knopku dlya UIAlertController
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        
        // Dobavlyem knopku na UIAlertController
        alertContr.addAction(action)
        
        // Pokazyvaem UIAlertController
        present(alertContr, animated: true, completion: nil)
    }
    
    @IBAction func backToMainScreen(segue: UIStoryboardSegue) {
        
        guard  let backVC = segue.source as? BackToMainViewController else { return }
        self.titleTF.text = backVC.backToMain
        
    }
    
    fileprivate func animatTitle() {
        UIView.animate(withDuration: 0.0,
                       delay: 0.5,
                       options: [],
                       animations: {[weak self] in
                        self?.firstLbl.alpha = 0
                        self?.firstLbl.alpha = 1
                       },
                       completion: nil)
        UIView.animate(withDuration: 0.5,
                       delay: 1,
                       options: [],
                       animations: {[weak self] in
                        self?.secondLbl.alpha = 0
                        self?.secondLbl.alpha = 1
                       },
                       completion: nil)
        UIView.animate(withDuration: 0.5,
                       delay: 1.5,
                       options: [],
                       animations: {[weak self] in
                        self?.thirdLbl.alpha = 0
                        self?.thirdLbl.alpha = 1
                       },
                       completion: {[weak self] _ in
                        guard let self = self else { return }
                        UIView.animate(withDuration: 0.5,
                                       delay: 0.5,
                                       options: [],
                                       animations: {[ weak self] in
                                        self?.firstLbl.alpha = 0
                                        self?.firstLbl.alpha = 1
                                       },
                                       completion: nil)
                        UIView.animate(withDuration: 0.5,
                                       delay: 1,
                                       options: [],
                                       animations: {[ weak self] in
                                        self?.secondLbl.alpha = 0
                                        self?.secondLbl.alpha = 1
                                       },
                                       completion: nil)
                        UIView.animate(withDuration: 0.5,
                                       delay: 1.5,
                                       options: [],
                                       animations: {[ weak self] in
                                        self?.thirdLbl.alpha = 0
                                        self?.thirdLbl.alpha = 1
                                       },
                                       completion: {[ weak self] _ in
                                        
                                        self?.userNameTF.text = "Gena"
                                        self?.passwordTF.text = "12345"})
                       })

    }
    
    func snakeAnimation() {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [0, 10, -10, 10, -5, 5, -5, 0 ]
        animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.75, 0.875, 1]
        animation.duration = 0.5
        animation.isAdditive = true
        
        passwordTF.layer.add(animation, forKey: "shake")
        userNameTF.layer.add(animation, forKey: "snake")
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let token = userNameTF.text,
              let num = passwordTF.text,
              let userld = Int(num) else { return }
        
        AccountSingleton.shared.token = token
        AccountSingleton.shared.userLD = userld
    }
    
}

