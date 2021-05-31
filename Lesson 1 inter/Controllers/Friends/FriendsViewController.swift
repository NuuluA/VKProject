//
//  FriendsViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 02.05.2021.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shadowImage: UIView!
    
    let imagePicker = UIImagePickerController()//galaryden surot alysh u4un controller
    
    var getFriends = [GetFriends]()
    var currentUserArray = [User]()
    var nameTitle = [String]()
    var nameDict = [String: [String]]()
    
    let identifierID = "cell"
   
    override func viewDidLoad() {
        super.viewDidLoad()
     
        imagePicker.delegate = self
        
        avatarImage.image = UIImage(named: "argen")
        nameLbl.text = "Argen Nurmamat"

        tableView.delegate = self
        tableView.dataSource = self
        searchBarSetup()
        
        avatarImage.layer.cornerRadius = avatarImage.frame.width * 0.5
        
        //Sozdali recognizer Tap
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(changePhoto(_ :)))
        avatarImage.addGestureRecognizer(recognizer)
        avatarImage.isUserInteractionEnabled = true
        
        shadow()
        
    }
    
//    func filterName() {
//        for name in currentUserArray {
//            guard let nameLetter = name.name?.index(name.name!.startIndex, offsetBy: 1) else { return }
//            let nameKey = String(name.name![..<nameLetter])
//            
//            if var nameValue = nameDict[nameKey] {
//                nameValue.append(name.name!)
//                nameDict[nameKey] = nameValue
//            } else {
//                nameDict[nameKey] = [name.name!]
//            }
//            nameTitle = [String](nameDict.keys)
//            nameTitle = nameTitle.sorted(by: {$0 < $1})
//            
//        }
//    }
    
    //Sozdali recognizer Tap func
    @objc func changePhoto(_ gesture: UITapGestureRecognizer) {
        
        let alert = UIAlertController(title: "Изменить фото", message: nil, preferredStyle: .actionSheet)
        
        let actionPhoto = UIAlertAction(title: "Выбрать фото", style: .default) { alert in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCamera = UIAlertAction(title: "Сделать снимок", style: .default) { alert in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
        
    }
   
    private func searchBarSetup() {
        searchBar.delegate = self
        searchBar.placeholder = "Поиск"
        currentUserArray = userArray
    }
    
    func shadow() {
        shadowImage.layer.shadowColor = UIColor.black.cgColor
        shadowImage.layer.shadowRadius = 8
        shadowImage.layer.shadowOpacity = 1.2
        shadowImage.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowImage.layer.cornerRadius = shadowImage.frame.width * 0.5
        shadowImage.layer.masksToBounds = false
    }
    
}

extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return nameTitle.count
//    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let nameKey = nameTitle[section]
//        if let nameValue = nameDict[nameKey] {
//            return nameValue.count
//        }
//        return nameTitle.count
        return currentUserArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FriendsTableViewCell else { return UITableViewCell() }
        
//        let nameKey = nameTitle[indexPath.section]
//        if let nameValue = nameDict[nameKey] {
//            cell.users?.name = nameValue[indexPath.row]
//        }
        
        cell.users = currentUserArray[indexPath.row]
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return nameTitle[section]
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        let user = currentUserArray[indexPath.row]
   
           // Sozdaem alert knopki
        let alert = UIAlertController(title: user.name, message: "Перейти в профиль", preferredStyle: .alert)
           let profileAction = UIAlertAction(title: "Фотографии", style: .default) { [weak self] (alert) in
               self?.performSegue(withIdentifier: "fromFriendsToFoto", sender: user) //bul metod mn kiyinki ekranga identifier(showImage) mn otkorup berebiz
           }
        
        // Sozdaem alert udalenie
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { (alert) in
            self.currentUserArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
        alert.addAction(profileAction) // Sozdannye alerty dobavlyaem na addAction
        alert.addAction(deleteAction)
        
        alert.addAction(UIAlertAction(title: "Отмена", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "fromFriendsToFoto" {
                guard let user = sender as? User,
                      let destination = segue.destination as? ImageCollectionViewController else { return }
                destination.users = user
            }
        }
    
    //Auto-hide the keyboard
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

extension FriendsViewController: UISearchBarDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        tableView.endEditing(true)
        
        guard !searchText.isEmpty else {
            currentUserArray = userArray
            tableView.reloadData()
            return
        }
        currentUserArray = userArray.filter({ user in
            (user.name?.lowercased().contains(searchText.lowercased()))!
        })
        tableView.reloadData()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            avatarImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

}

