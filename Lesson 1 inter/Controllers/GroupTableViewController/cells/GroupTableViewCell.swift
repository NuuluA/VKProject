//
//  GroupTableViewCell.swift
//  Lesson 1 inter
//
//  Created by Арген on 15.04.2021.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupDescription: UILabel!
    
    var saveGroup: Group? {
        didSet {
            groupLabel.text = saveGroup?.groupName
            groupDescription.text = saveGroup?.description
            groupImage.image = saveGroup?.groupImage
        }
    }
    
    func clear() {
        groupImage.image = nil
        groupLabel.text = nil
        groupDescription.text = nil
        saveGroup = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clear()
        layerColor()
    }
    
    override func prepareForReuse() {
        clear()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
        
    func configureGroup(group: Group) {
        
        groupLabel.text = group.groupName
        
        if let description = group.description {
            groupDescription.text = description
        }
        
        if let image = group.groupImage {
            groupImage.image = image
        }
        saveGroup = group
    }    
    
    func layerColor() {
        
        groupImage.layer.cornerRadius = 20
        groupImage.layer.borderWidth = 0.9
        groupImage.layer.borderColor = UIColor.red.cgColor
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 6
        shadowView.layer.shadowOpacity = 1.2
        shadowView.layer.shadowOffset = CGSize(width: -4, height: 2)

    }
   
}


