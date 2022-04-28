//
//  Settable Cell.swift
//  OneLab-HW3
//
//  Created by user on 19.04.2022.
//

import Foundation

protocol SettableCell {
    associatedtype TypeOfData
    static var heightOfCell: Double {get}
    func configure(with data: TypeOfData)
}
extension SettableCell {
    static var reuseIdentifier: String { return String(describing: Self.self) }
}
