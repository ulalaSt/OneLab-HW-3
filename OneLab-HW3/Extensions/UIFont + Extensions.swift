//
//  UIFont + Extensions.swift
//  OneLab-HW3
//
//  Created by user on 20.04.2022.
//

import Foundation
import UIKit

extension UIFont {
    
    enum CustomType {
        case regular,bold,semibold
    }
    
    static func mainCustomFont(_ type: CustomType, size: CGFloat) -> UIFont {
        let font: UIFont?
        switch type {
        case .regular:
            font = UIFont(name: "SFProDisplay-Regular", size: size)
        case .bold:
            font = UIFont(name: "SFProDisplay-Semibold", size: size)
        case .semibold:
            font = UIFont(name: "SFProDisplay-Bold", size: size)
        }
        assert(font != nil, "Can't load main custom font of type: \(type)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
}
