//
//  CellActionProxy.swift
//  One-Lab-3
//
//  Created by Farukh on 23.04.2022.
//

import Foundation
import UIKit

class CellActionProxy {
    
    private var actions = [String: ((CellConfigurator) -> Void)]()
    
    func invoke(action: CellAction, configurator: CellConfigurator) {
        let key = "\(action.hashValue)\(type(of: configurator).reuseID)"
        if let action = actions[key] {
            action(configurator)
        }
    }
    
    func on<CellType, DataType>(action: CellAction, handler: @escaping ((TableViewCellConfigurator<CellType, DataType>) -> Void)) {
        let key = "\(action.hashValue)\(CellType.reuseIdentifier)"
        actions[key] = { configurator in
            handler(configurator as! TableViewCellConfigurator<CellType, DataType>)
        }
        //Why we need to return?
    }
}
