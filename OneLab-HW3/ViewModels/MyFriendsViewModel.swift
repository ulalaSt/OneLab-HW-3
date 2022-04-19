//
//  FriendsViewModel.swift
//  OneLab-HW3
//
//  Created by user on 17.04.2022.
//

import Foundation

class MyFriendsViewModel {
    let users: [User] = [
        User(name: "Ulan Seitkali", imageName: "Seitkali", position: String(localized: "Business magnate"), status: .online, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Mark Zuckerberg", imageName: "Zuckerberg", position: String(localized: "Software Engineer"), status: .recent, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Larry Page", imageName: "Page", position: String(localized: "CEO"), status: .recent, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Barack Obama", imageName: "Obama", position: String(localized: "Ex-President"), status: .offline, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Elon Musk", imageName: "Musk", position: String(localized: "Engineer"), status: .online, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Steve Jobs", imageName: "Jobs", position: String(localized: "Entrepreneur"), status: .offline, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Tim Cook", imageName: "Cook", position: String(localized: "CEO"), status: .offline, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Warren Buffett", imageName: "Buffett", position: String(localized: "Investor"), status: .recent, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Sergey Brin", imageName: "Brin", position: String(localized: "Entrepreneur"), status: .online, nickName: nil, friends: nil, isYourFriend: true),
        User(name: "Jeff Bezos", imageName: "Bezos", position: String(localized: "Entrepreneur"), status: .online, nickName: nil, friends: nil, isYourFriend: true)
    ]
}

