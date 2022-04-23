//
//  CellActionProxy.swift
//  One-Lab-3
//
//  Created by Farukh on 23.04.2022.
//

import Foundation
import UIKit

class CellActionProxy {
    private var actions = [String: ((CellConfigurator, UIView) -> Void)]()
    
    // invoke some action and makes some notification
    func invoke(action: CellAction, cell: UIView, configurator: CellConfigurator) {
        let key = "\(action.hashValue)\(type(of: configurator).reuseID)"
        if let action = actions[key] {
            action(configurator, cell)
        }
    }
    
    // subscribe to cell action
    @discardableResult
    func on<CellType, DataType>(action: CellAction, handler: @escaping ((TableViewCellConfigurator<CellType, DataType>, CellType) -> Void)) -> Self {
        let key = "\(action.hashValue)\(CellType.reuseIdentifier)"
        actions[key] = { c, cell in
            handler(c as! TableViewCellConfigurator<CellType, DataType>, cell as! CellType)
        }
        return self
    }
}
