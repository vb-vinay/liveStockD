//
//  Extensions.swift
//  VinPro
//
//  Created by Deveesh Mehandiratta on 26/02/20.
//  Copyright © 2020 Deveesh Mehandiratta. All rights reserved.
//

import UIKit

extension UIColor {
    /// UIColor initialiser from rgb values
    /// - Parameter red: Red value (should be between 0 to 255)
    /// - Parameter green: green value (should be between 0 to 255)
    /// - Parameter blue: blue value (should be between 0 to 255)
    convenience init(red: Int, green: Int, blue: Int) {
        let isRedValid = (red >= 0 && red <= 255)
        let isGreenValid = (green >= 0 && green <= 255)
        let isBlueValid = (blue >= 0 && blue <= 255)

        assert(isRedValid, "Invalid red component")
        assert(isGreenValid, "Invalid green component")
        assert(isBlueValid, "Invalid blue component")

        if isRedValid && isGreenValid && isBlueValid {
            self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
        } else {
            self.init(red: 1, green: 1, blue: 1, alpha: 1.0)
        }
    }

    /// UIColor initialisation with a hex value
    /// - Parameter rgb: Hex value
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
