//
//  Models.swift
//  OneLab-HW3
//
//  Created by user on 17.04.2022.
//

import Foundation

struct User {
    let name: String
    let imageName: String
    let position: String
    let status: Status
    let nickName: String?
    let friends: Int?
    let isYourFriend: Bool
}

enum Status {
    case online, recent, offline
}

struct Info {
    let info: String
    let imageName: String
}

struct Section {
    var name: String!
    var showNumberOfRows: Bool!
    var items: [Configurator]!
    init(name: String, showNumberOfRows: Bool, items: [Configurator]) {
        self.name = name
        self.showNumberOfRows = showNumberOfRows
        self.items = items
    }
}
