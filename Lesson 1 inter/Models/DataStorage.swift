//
//  DataStorage.swift
//  Lesson 1 inter
//
//  Created by Арген on 14.04.2021.
//

import UIKit

class DataStorage: NSObject {
    static let shared = DataStorage()
    private override init() {
        super.init()
    }
    
    var allGroup = [Group]()
    var favoriteGroup = [Group]()
    
}

