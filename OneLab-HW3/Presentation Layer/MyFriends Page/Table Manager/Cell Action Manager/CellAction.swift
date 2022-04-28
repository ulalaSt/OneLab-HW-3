//
//  CellAction.swift
//  One-Lab-3
//
//  Created by Farukh on 23.04.2022.
//

import Foundation
import UIKit

enum CellAction: Hashable {
    case custom(String)
    
    var hashValue: Int {
        switch self {
        case .custom(let custom):
            return custom.hashValue
        }
    }
}

struct CellActionEventData {
    let action: CellAction
    let cell: UITableViewCell
}

extension CellAction {
    static let notificationName = NSNotification.Name("cellAction")
    
    func invoke(cell: UITableViewCell) {
            NotificationCenter.default.post(name: CellAction.notificationName, object: nil, userInfo: ["data": CellActionEventData(action: self, cell: cell)])
    }
}


