//
//  Color Manager.swift
//  OneLab-HW3
//
//  Created by user on 20.04.2022.
//

import Foundation
import UIKit

extension UIColor {
    
    static let customBlue = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
    
    //LightMode To DarkMode Colors
    static let grayToTransparent = UIColor(named: "Gray to Transparent")!
    static let transparentToDark = UIColor(named: "Transparent to Dark")!
    static let whiteToBlack = UIColor(named: "White To Black")!
    static let secondaryToDark = UIColor(named: "Secondary To Dark")!
    static let blackToGray = UIColor(named: "Black to Gray")!
    static let lightToDarkGray = UIColor(named: "LightGray To DarkGray")!
    
    //For Status Icons
    static func appropriateColor(of status: User.Status) -> UIColor {
        switch status {
        case .online:
            return UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        case .recent:
            return UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
        case .offline:
            return .secondaryToDark
        }
    }
}
