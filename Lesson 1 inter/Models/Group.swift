//
//  Group.swift
//  Lesson 1 inter
//
//  Created by Арген on 13.04.2021.
//

import UIKit

struct Group {
    var groupName: String?
    var groupImage: UIImage?
    var description: String?
    var imageGallery = [UIImage]()
}

var groupArray: [Group] = {
    
    var group1 = Group()
    group1.groupName = "Животные"
    group1.groupImage = UIImage(named: "animals")
    group1.description = "Мир животных"
    group1.imageGallery = [UIImage(named: "animals0")!, UIImage(named: "animals1")!, UIImage(named: "animals2")!, UIImage(named: "animals3")!]
    
    var group2 = Group()
    group2.groupName = "Аато и Мото"
    group2.groupImage = UIImage(named: "avto")
    group2.description = "Автоклуб BMW"
    group2.imageGallery = [UIImage(named: "car0")!, UIImage(named: "car1")!, UIImage(named: "car2")!, UIImage(named: "car3")!]
    
    var group3 = Group()
    group3.groupName = "Кино"
    group3.groupImage = UIImage(named: "kino")
    group3.description = "Комедия"
    group3.imageGallery = [UIImage(named: "film0")!, UIImage(named: "film1")!, UIImage(named: "film2")!, UIImage(named: "film3")!]
    
    var group4 = Group()
    group4.groupName = "Спорт"
    group4.groupImage = UIImage(named: "sport")
    group4.description = "Борьба"
    group4.imageGallery = [UIImage(named: "fila0")!, UIImage(named: "fila1")!, UIImage(named: "fila2")!, UIImage(named: "fila3")!]
    
    var group5 = Group()
    group5.groupName = "Игры"
    group5.groupImage = UIImage(named: "game")
    group5.description = "PUBG"
    group5.imageGallery = [UIImage(named: "game0")!, UIImage(named: "game1")!, UIImage(named: "game2")!, UIImage(named: "game3")!]
    
    var group6 = Group()
    group6.groupName = "Музыка"
    group6.groupImage = UIImage(named: "music")
    group6.description = "Поп-Музон"
    group6.imageGallery = [UIImage(named: "music0")!, UIImage(named: "music1")!, UIImage(named: "music2")!, UIImage(named: "music3")!]
    
    return [group1, group2, group3, group4, group5, group6]
    
}()


