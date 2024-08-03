//
//  String+Color.swift
//  VkApp
//
//  Created by Mac on 03.08.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import UIKit

extension String {
    /// Returns an instance of color loaded from bundle by the name equals to this string
    var uiColor: UIColor {
        let color = UIColor(named: self) ?? UIColor()
        return color
    }
}
