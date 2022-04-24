//
//  User.swift
//  OneLab-HW3
//
//  Created by user on 19.04.2022.
//

import Foundation

struct User {
    let name: String
    let imageName: String
    let position: String
    let status: Status
    let nickName: String
    let numberOfFriends: Int
    var isYourFriend: Bool
    
    enum Status {
        case online, recent, offline
    }
}
