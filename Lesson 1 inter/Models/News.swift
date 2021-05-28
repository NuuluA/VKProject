//
//  News.swift
//  Lesson 1 inter
//
//  Created by Арген on 27.04.2021.
//

import Foundation

struct News {
    var avatar: String?
    var allImage: String?
    var textName: String?
   
}

var newsArray: [News] = {
    
    var newsSave = News()
    newsSave.avatar = "4_1"
    newsSave.allImage = "4_5"
    newsSave.textName = "Джейсон Стейтем"
    
    var newsSave2 = News()
    newsSave2.avatar = "1_1"
    newsSave2.allImage = "1_2"
    newsSave2.textName = "Брэд Питт"
    
    var newsSave3 = News()
    newsSave3.avatar = "2_1"
    newsSave3.allImage = "2_2"
    newsSave3.textName = "Леонардо Ди Каприо"
    
    var newsSave4 = News()
    newsSave4.avatar = "3_1"
    newsSave4.allImage = "3_4"
    newsSave4.textName = "Дуэйн Джонсон"
    
    return [newsSave, newsSave2, newsSave3, newsSave4]
    
}()

