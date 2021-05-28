//
//  AllGroupTableViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 15.04.2021.
//

import UIKit

class AllGroupTableViewController: UITableViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    var currentGroupArray = [Group]() //update table
    var groupImage = Group()
    
    let identifierID = "GroupTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: identifierID)
        
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Поиск"
        currentGroupArray = groupArray
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return currentGroupArray.count
//        return groupImage.imageGallery.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierID, for: indexPath) as? GroupTableViewCell else { return UITableViewCell()}
        
        cell.saveGroup = currentGroupArray[indexPath.item]
//        let image = groupImage.imageGallery[indexPath.item]
//        cell.imageView?.image = image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? GroupTableViewCell,
              let group = cell.saveGroup
        
        else { return }
        
        var isEnable = false
        
        for item in DataStorage.shared.favoriteGroup {
            if item.groupImage == group.groupImage {
                isEnable = true
            }
        }
        
        if !isEnable {
            DataStorage.shared.favoriteGroup.append(group)
        }
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //Auto-hide the keyboard
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    

}

extension AllGroupTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            currentGroupArray = groupArray
            tableView.reloadData()
            return
        }
        currentGroupArray = groupArray.filter({ group in
            (group.groupName?.lowercased().contains(searchText.lowercased()))!
            
        })
        tableView.reloadData()
    }
}
