//
//  UserCellViewModel.swift
//  OneLab-HW3
//
//  Created by user on 19.04.2022.
//

import Foundation

class UserCellViewModel {
    
    var isAdded: Bool!
    
    func addTapped() {
        self.isAdded = !isAdded
    }
}