//
//  Configurator.swift
//  OneLab-HW3
//
//  Created by user on 19.04.2022.
//

import Foundation
import UIKit

protocol Configurator {
    static var reuseID: String { get }
    static var cellClass: AnyClass { get }
    static var height: Double { get }
    func configure(cell: UIView)
}
