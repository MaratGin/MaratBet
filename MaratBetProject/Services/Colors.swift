//
//  Colors.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 24.04.2022.
//

import Foundation
import UIKit
class Colors {
    static let grayViewColor = hexStringToUIColor(hex: "#F0EFF1")
    static let buttonColor = hexStringToUIColor(hex: "#E2E1E3")
    static let flameColor = hexStringToUIColor(hex: "#DF5722")
    static let footballIconColor = hexStringToUIColor(hex: "#80DF22")
    static let basketballIconColor = hexStringToUIColor(hex: "#8B20D5")
    static let hockeyIconColor = hexStringToUIColor(hex: "#0089CF")
    static let chosenButton = hexStringToUIColor(hex: "#0F72EA")
    static let detailViewBackground = hexStringToUIColor(hex: "#33FF8C")
    static let goldTabBarItemColor = hexStringToUIColor(hex: "#FFD700")
    static let whiteColor = hexStringToUIColor(hex: "#F5F6F5")
    
    static func hexStringToUIColor (hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if (cString.count) != 6 {
            return UIColor.gray
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
