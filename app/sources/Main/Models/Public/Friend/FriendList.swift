//
//  FriendList.swift
//  VkApp
//
//  Created by Mac on 02.09.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import Foundation

class FriendList {
    // MARK: - Init
    init(_ list: [Friend]) {
        self.list = list
    }
    
    // MARK: - Properties
    private var list: [Friend]
    
    // MARK: - Public properties
    var friends: [Friend] {
        return list
    }
    
    var count: Int {
        return list.count
    }
    
    // MARK: - Interface
    func addFriend(_ friend: Friend) {
        if !friend.id.isEmpty {
            list.append(friend)
        }
    }
    
    func friendAtIndex(_ index: Int) -> Friend? {
        if (index < 0 || index > count - 1) {
            return nil
        }
        
        return list[index]
    }
    
    func removeFriend(_ friend: Friend) {
        if let index = list.firstIndex(of: friend) {
            list.remove(at: index)
        }
    }
    
    func hasFriend(_ friend: Friend) -> Bool {
        return list.firstIndex(of: friend) == nil
    }
}
