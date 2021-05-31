//
//  VKFriendsList.swift
//  Lesson 1 inter
//
//  Created by Арген on 31.05.2021.
//

import Foundation
import Alamofire

class GetFriends {
    
    let url = "https://api.vk.com/method/friends.getLists=7868020?friends&access_token=c229e99bc229e99bc229e99ba4c251&v=5.131"
     
    func getList(get: GetFriends) {
        AF.request(url, method: .get).responseJSON { response in
            print(response.value as Any)
        }
    }
}

