//
//  FriendCellViewModel.swift
//  VkApp
//
//  Created by Mac on 07.09.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import Foundation

class FriendCellViewModel: Configurable {
    // MARK: - Init
    init(friend: Friend) {
        self.friend = friend
    }
    
    // MARK: - Properties
    private let friend: Friend
    
    // MARK: - Configurable
    var icon: String { friend.avatar }
    
    var title: String { friend.firstName + " " + friend.lastName }
    
    var subtitle: String { "\(friend.age)" + " years old, " + friend.homeCity }
}
