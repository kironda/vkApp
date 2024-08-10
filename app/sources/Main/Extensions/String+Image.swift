//
//  String+Image.swift
//  VkApp
//
//  Created by Mac on 06.08.2024.
//  Copyright © 2024 Mikhail_K. All rights reserved.
//

import UIKit

extension String {
    /// Returns an instance of image loaded from bundle by the name equals to this string
    var uiImage: UIImage {
        let image = UIImage(named: self) ?? UIImage()
        return image
    }
}
