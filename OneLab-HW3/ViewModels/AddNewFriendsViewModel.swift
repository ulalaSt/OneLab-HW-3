

import Foundation

typealias OptionCellConfigurator = TableViewCellConfigurator<OptionTableViewCell, Option>
typealias UserCellConfigurator = TableViewCellConfigurator<UserTableViewCell, User>

class AddNewFriendsViewModel {
    
    let sections: [TableSection] = [
        TableSection(
            sectionName: String(localized: "Add New Contacts"),
            showNumberOfRows: false,
            items: [
                OptionCellConfigurator(
                    item: Option(text: String(localized: "From Contacts"),iconName: "book")),
                OptionCellConfigurator(
                    item: Option(text: String(localized: "By Username"), iconName: "signature")),
                OptionCellConfigurator(
                    item: Option(text: String(localized: "By Phone Number"), iconName: "phone.connection")),
            ]),
        TableSection(
            sectionName: String(localized: "You Might Know Them"),
            showNumberOfRows: true,
            items: [
                UserCellConfigurator(item: User(
                    name: "Ulan Seitkali",
                    imageName: "Seitkali",
                    position: String(localized: "Business magnate"),
                    status: .online,
                    nickName: "Ulala",
                    numberOfFriends: 10048,
                    isYourFriend: true)),
                UserCellConfigurator(item: User(
                    name: "Elon Musk",
                    imageName: "Musk",
                    position: String(localized: "Engineer"),
                    status: .online,
                    nickName: "muskular_Elon",
                    numberOfFriends: 5675,
                    isYourFriend: true)),
                UserCellConfigurator(item: User(
                    name: "Steve Jobs",
                    imageName: "Jobs",
                    position: String(localized: "Entrepreneur"),
                    status: .offline,
                    nickName: "steve_Jobs",
                    numberOfFriends: 11298,
                    isYourFriend: false)),
                UserCellConfigurator(item: User(
                    name: "Tim Cook",
                    imageName: "Cook",
                    position: String(localized: "CEO"),
                    status: .offline,
                    nickName: "Timeke_1",
                    numberOfFriends: 3200,
                    isYourFriend: true)),
                UserCellConfigurator(item: User(
                    name: "Warren Buffett",
                    imageName: "Buffett",
                    position: String(localized: "Investor"),
                    status: .recent,
                    nickName: "buffett.warren",
                    numberOfFriends: 3000,
                    isYourFriend: false)),
                UserCellConfigurator(item: User(
                    name: "Sergey Brin",
                    imageName: "Brin",
                    position: String(localized: "CEO"),
                    status: .online,
                    nickName: "serega_brin",
                    numberOfFriends: 4500,
                    isYourFriend: false)),
                UserCellConfigurator(item: User(
                    name: "Jeff Bezos",
                    imageName: "Bezos",
                    position: String(localized: "Entrepreneur"),
                    status: .online,
                    nickName: "jeff.Bezos",
                    numberOfFriends: 320,
                    isYourFriend: true))
            ])
    ]
}
