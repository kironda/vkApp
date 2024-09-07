//
//  Friend.swift
//  VkApp
//
//  Created by Mac on 02.09.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import Foundation

struct Friend: Equatable {
    let id: String
    let avatar: String
    let firstName: String
    let lastName: String
    let homeCity: String
    let age: Int
    
    // MARK: - Equatable
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        return lhs.id == rhs.id
    }
}
