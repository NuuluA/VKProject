//
//  GroupTableViewController.swift
//  Lesson 1 inter
//
//  Created by Арген on 14.04.2021.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    let identifierID = "GroupTableViewCell"
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: identifierID)
                
    }
    
    // MARK: - Table view data source
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return DataStorage.shared.favoriteGroup.count
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataStorage.shared.favoriteGroup.count

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifierID, for: indexPath) as? GroupTableViewCell
        else { return UITableViewCell()}
        
        cell.configureGroup(group: DataStorage.shared.favoriteGroup[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        DataStorage.shared.favoriteGroup.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = DataStorage.shared.favoriteGroup[indexPath.row]
        self.performSegue(withIdentifier: "cell", sender: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "cell" {
                guard let user = sender as? Group,
                      let destination = segue.destination as? PhotoViewController else { return }
                destination.group = user
            }
        }

}
