//
//  AddNewFriendsViewModel.swift
//  OneLab-HW3
//
//  Created by user on 18.04.2022.
//

import Foundation
import UIKit

class AddNewFriendsViewModel {
    typealias InfoCellConfigurator = CellConfigurator<InfoTableViewCell, Info>
    typealias UserCellConfigurator = CellConfigurator<UserTableViewCell, User>
    
    let sections: [Section] = [
        Section(name: String(localized: "Add New Contacts"),
                showNumberOfRows: false,
                items: [
                    InfoCellConfigurator(item: Info(info: String(localized: "From Contacts"), imageName: "book")),
                    InfoCellConfigurator(item: Info(info: String(localized: "By Username"), imageName: "signature")),
                    InfoCellConfigurator(item: Info(info: String(localized: "By Phone Number"), imageName: "phone.connection")),
                ]),
        Section(name: String(localized: "You Might Know Them"),
                showNumberOfRows: true,
                items: [
                    UserCellConfigurator(item: User(name: "Ulan Seitkali", imageName: "Seitkali", position: String(localized: "Business magnate"), status: .online, nickName: "Ulala", friends: 10048, isYourFriend: true)),
                    UserCellConfigurator(item: User(name: "Elon Musk", imageName: "Musk", position: String(localized: "Engineer"), status: .online, nickName: "muskular_Elon", friends: 5675, isYourFriend: true)),
                    UserCellConfigurator(item: User(name: "Steve Jobs", imageName: "Jobs", position: String(localized: "Entrepreneur"), status: .offline, nickName: "steve_Jobs", friends: 11298, isYourFriend: false)),
                    UserCellConfigurator(item: User(name: "Tim Cook", imageName: "Cook", position: String(localized: "CEO"), status: .offline, nickName: "Timeke_1", friends: 3200, isYourFriend: true)),
                    UserCellConfigurator(item: User(name: "Warren Buffett", imageName: "Buffett", position: String(localized: "Investor"), status: .recent, nickName: "buffett.warren", friends: 3000, isYourFriend: false)),
                    UserCellConfigurator(item: User(name: "Sergey Brin", imageName: "Brin", position: String(localized: "CEO"), status: .online, nickName: "serega_brin", friends: 4500, isYourFriend: false)),
                    UserCellConfigurator(item: User(name: "Jeff Bezos", imageName: "Bezos", position: String(localized: "Entrepreneur"), status: .online, nickName: "jeff.Bezos", friends: 320, isYourFriend: true))
                ])
    ]
}
