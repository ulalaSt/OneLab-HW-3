//
//  TableSectionModel.swift
//  OneLab-HW3
//
//  Created by user on 19.04.2022.
//

import Foundation

// Model for each section of table
struct TableSection {
    var sectionName: String
    var showNumberOfRows: Bool
    var items: [CellConfigurator]
}
