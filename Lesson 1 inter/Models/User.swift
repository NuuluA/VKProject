//
//  User.swift
//  Lesson 1 inter
//
//  Created by Арген on 12.04.2021.
//

import UIKit

struct User {
    
    var name: String?
    var avatarImage: String?
    var fotoArray = [UIImage]()
  
}

var userArray: [User] = {

    var user1 = User()
    user1.avatarImage = "van"
    user1.name = "Ван Дамм"
    user1.fotoArray = [UIImage(named: "1.1")!, UIImage(named: "2.1")!, UIImage(named: "3.1")!, UIImage(named: "4.1")!, UIImage(named: "5.1")!]

    var user2 = User()
    user2.avatarImage = "arnold"
    user2.name = "Арнольд Шварценеггер"
    user2.fotoArray = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!]

    var user3 = User()
    user3.avatarImage = "1_1"
    user3.name = "Брэд Питт"
    user3.fotoArray = [UIImage(named: "1_1")!, UIImage(named: "1_2")!, UIImage(named: "1_3")!, UIImage(named: "1_4")!]

    var user4 = User()
    user4.avatarImage = "2_1"
    user4.name = "Леонардо Ди Каприо"
    user4.fotoArray = [UIImage(named: "2_1")!, UIImage(named: "2_2")!, UIImage(named: "2_3")!, UIImage(named: "2_4")!, UIImage(named: "2_5")!]

    var user5 = User()
    user5.avatarImage = "3_1"
    user5.name = "Дуэйн Джонсон"
    user5.fotoArray = [UIImage(named: "3_1")!, UIImage(named: "3_2")!, UIImage(named: "3_3")!, UIImage(named: "3_4")!, UIImage(named: "3_5")!]

    var user6 = User()
    user6.avatarImage = "4_1"
    user6.name = "Джейсон Стейтем"
    user6.fotoArray = [UIImage(named: "4_1")!, UIImage(named: "4_2")!, UIImage(named: "4_3")!, UIImage(named: "4_4")!, UIImage(named: "4_5")!]


    return [user1, user2, user3, user4, user5, user6]
}()

