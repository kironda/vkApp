//
//  Color.swift
//  VkApp
//
//  Created by Mac on 03.08.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import UIKit

struct Color {
    private init() {}
    
    // MARK: - Gradient
    struct Gradient {
        private init() {}
        
        static var startColor: UIColor { "vk.gradient.start".uiColor }
        static var endColor: UIColor { "vk.gradient.end".uiColor }
    }
}
