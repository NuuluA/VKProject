//
//  Singleton.swift
//  Lesson 1 inter
//
//  Created by Арген on 27.05.2021.
//

import Foundation
 
final class AccountSingleton {
    private init() {}
    static let shared = AccountSingleton()
    
    var token: String = ""
    var userLD: Int = 0
}
