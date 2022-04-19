//
//  UserCell.swift
//  OneLab-HW3
//
//  Created by user on 18.04.2022.
//

import Foundation
import UIKit

//MARK: - Main UI's
class UserTableViewCell: UITableViewCell {
    private var userNickname: UILabel = {
        let label = UILabel()
        label.isUserInteractionEnabled = true
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
        return label
    }()
    private var statusIcon: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.borderColor = UIColor(named: "MyFriendsCellColor")!.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    private var userImage: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        return imageV
    }()
    private var friendsCount: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        return label
    }()
    private let addButton: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.layer.borderWidth = 2
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.spacing = 2
        return stackView
    }()
    private let addLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 14)
        return label
    }()
    private let addImage: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFit
        return imageV
    }()
    
    private let viewModel = UserCellViewModel()
    
    override func layoutSubviews() {
        contentView.addSubview(userImage)
        userImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(48)
        }
        contentView.addSubview(statusIcon)
        statusIcon.snp.makeConstraints { make in
            make.size.equalTo(17)
            make.bottom.trailing.equalTo(userImage)
        }
        contentView.addSubview(userNickname)
        userNickname.snp.makeConstraints { make in
            make.top.equalTo(userImage)
            make.leading.equalTo(userImage.snp.trailing).offset(12)
            make.height.equalTo(userImage.snp.height).dividedBy(2)
        }
        contentView.addSubview(friendsCount)
        friendsCount.snp.makeConstraints { make in
            make.leading.equalTo(userNickname)
            make.top.equalTo(userNickname.snp.bottom)
            make.bottom.equalTo(userImage.snp.bottom)
        }
        contentView.addSubview(addButton)
        addButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addTapped)))
        addButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        addButton.addArrangedSubview(addImage)
        addImage.snp.makeConstraints { make in
            make.size.equalTo(14)
            make.bottom.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
        }
        
        addButton.addArrangedSubview(addLabel)
        
        DispatchQueue.main.async {
            self.addButton.layer.cornerRadius = self.addButton.frame.height/2
            self.userImage.layer.cornerRadius = self.userImage.frame.width/2
            self.statusIcon.layer.cornerRadius = self.statusIcon.frame.height/2
        }
    }
    
    @objc func addTapped() {
        viewModel.addTapped()
        checkAdded(isAdded: viewModel.isAdded)
    }
    
}

//MARK: - Conformance to SettableCell
extension UserTableViewCell: SettableCell {
    typealias TypeOfData = User
    
    static var height: Double {return 72}

    func configure(with data: User) {
        userNickname.text = data.nickName
        userImage.image = UIImage(named: data.imageName)
        
        viewModel.isAdded = data.isYourFriend
        checkAdded(isAdded: data.isYourFriend)

        if data.friends!<4000 {
            friendsCount.text = "\(data.friends!) "+String(localized: "Friends")
        } else {
            let number = data.friends!
            let first = number / 1000
            let second = (number % 1000)/100
            if second != 0 {
                friendsCount.text = "\(first).\(second)K "+String(localized: "Friends")
            } else {
                friendsCount.text = "\(first)K "+String(localized: "Friends")
            }
        }
        
        switch data.status {
        case .online:
            statusIcon.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        case .recent:
            statusIcon.backgroundColor = UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
        case .offline:
            statusIcon.backgroundColor = UIColor(named: "MyFriendsBackground")
        }
    }
    
    func checkAdded(isAdded: Bool){
        if isAdded {
            addButton.layer.borderColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
            addButton.backgroundColor = UIColor(white: 1, alpha: 0)
            addLabel.text = String(localized: "ADD")
            addLabel.textColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
            addImage.image = UIImage(systemName: "plus.circle.fill")
            addImage.tintColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        } else {
            addButton.layer.borderColor = UIColor(named: "AddIconBorder")!.cgColor
            addButton.backgroundColor = UIColor(named: "AddIconFill")
            addLabel.text = String(localized: "ADDED")
            addLabel.textColor = .systemGray
            addImage.image = UIImage(systemName: "checkmark.circle.fill")
            addImage.tintColor = .systemGray
        }
    }

}

//MARK: - Modifies CG Colors when Interface mode (Light Mode/Dark Mode) changes
extension UserTableViewCell {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateCG()
    }
    func updateCG(){
        if !viewModel.isAdded {
            addButton.layer.borderColor = UIColor(named: "AddIconBorder")!.cgColor
        }
        statusIcon.layer.borderColor = UIColor(named: "MyFriendsCellColor")!.cgColor
    }
}
