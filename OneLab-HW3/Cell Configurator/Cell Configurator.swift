//
//  Configurator.swift
//  OneLab-HW3
//
//  Created by user on 18.04.2022.
//

import Foundation
import UIKit

class CellConfigurator<CellType: SettableCell, DataType>: Configurator where CellType.TypeOfData == DataType, CellType: UITableViewCell {
    
    static var reuseID: String {
        return String(describing: CellType.self)
    }
    
    static var cellClass: AnyClass {
        return CellType.self
    }
    
    static var height: Double {
        return CellType.height
    }
    
    let item: DataType
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).configure(with: item)
    }
}
