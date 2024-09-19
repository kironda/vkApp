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
        
        static var start: UIColor { "vk.gradient.start".uiColor }
        static var end: UIColor { "vk.gradient.end".uiColor }
        
        // MARK: - Button
        struct Button {
            private init() {}
            
            static var start: UIColor { "vk.gradient.button.start".uiColor }
            static var end: UIColor { "vk.gradient.button.end".uiColor }
        }
    }
    
    // MARK: - Brand
    struct Brand {
        private init() {}
        
        static var text: UIColor { "vk.brand.text".uiColor }
        static var tint: UIColor { "vk.brand.tint".uiColor }
    }
    
    // MARK: - Main
    struct Main {
        private init() {}
        
        static var text: UIColor { "vk.main.text".uiColor }
        static var tint: UIColor { "vk.main.tint".uiColor }
    }
}

