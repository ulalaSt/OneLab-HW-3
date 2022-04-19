//
//  UserCell.swift
//  OneLab-HW3
//
//  Created by user on 18.04.2022.
//

import Foundation
import UIKit

//MARK: - Each user cell has nickname, status icon, image, friends count, and Add to friends button. Conforming them and configuring action when the Add button tapped.

class UserTableViewCell: UITableViewCell {
    
    private let viewModel = UserCellViewModel()
    
    private var userNickname: UILabel = {
        let userNickname = UILabel()
        userNickname.isUserInteractionEnabled = true
        userNickname.font = .mainCustomFont(.semibold, size: 17)
        return userNickname
    }()
    private var userStatusIcon: UIView = {
        let userStatusIcon = UIView()
        userStatusIcon.clipsToBounds = true
        userStatusIcon.layer.borderColor = UIColor.whiteToBlack.cgColor
        userStatusIcon.layer.borderWidth = 2
        return userStatusIcon
    }()
    private var userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        return userImageView
    }()
    private var userFriendsLabel: UILabel = {
        let userFriendsLabel = UILabel()
        userFriendsLabel.textColor = .systemGray
        userFriendsLabel.font = .mainCustomFont(.regular, size: 13)
        return userFriendsLabel
    }()
    private let addToFriendsButton: UIStackView = {
        let addToFriendsButton = UIStackView()
        addToFriendsButton.alignment = .center
        addToFriendsButton.axis = .horizontal
        addToFriendsButton.layer.borderWidth = 2
        addToFriendsButton.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        addToFriendsButton.isLayoutMarginsRelativeArrangement = true
        addToFriendsButton.spacing = 2
        return addToFriendsButton
    }()
    private let addLabel: UILabel = {
        let addLabel = UILabel()
        addLabel.font = .mainCustomFont(.semibold, size: 14)
        return addLabel
    }()
    private let addIcon: UIImageView = {
        let addIcon = UIImageView()
        addIcon.contentMode = .scaleAspectFit
        return addIcon
    }()
    
    override func layoutSubviews() {
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(contentView.snp.height).dividedBy(1.5)
        }
        contentView.addSubview(userStatusIcon)
        userStatusIcon.snp.makeConstraints { make in
            make.size.equalTo(userImageView).dividedBy(2.5)
            make.bottom.trailing.equalTo(userImageView)
        }
        contentView.addSubview(userNickname)
        userNickname.snp.makeConstraints { make in
            make.top.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(12)
            make.height.equalTo(userImageView).dividedBy(2)
        }
        contentView.addSubview(userFriendsLabel)
        userFriendsLabel.snp.makeConstraints { make in
            make.leading.equalTo(userNickname)
            make.top.equalTo(userNickname.snp.bottom)
            make.bottom.equalTo(userImageView)
        }
        contentView.addSubview(addToFriendsButton)
        addToFriendsButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        addToFriendsButton.addArrangedSubview(addIcon)
        addIcon.snp.makeConstraints { make in
            make.size.equalTo(14)
            make.bottom.top.equalToSuperview().inset(10)
        }
        
        addToFriendsButton.addArrangedSubview(addLabel)
        addToFriendsButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapAddToFriends)))
        
        DispatchQueue.main.async {
            self.addToFriendsButton.layer.cornerRadius = self.addToFriendsButton.frame.height/2
            self.userImageView.layer.cornerRadius = self.userImageView.frame.width/2
            self.userStatusIcon.layer.cornerRadius = self.userStatusIcon.frame.height/2
        }
    }
    
    @objc func didTapAddToFriends() {
        viewModel.didTapAddToFriends()
        updateAddToFriendsButton(viewModel.isAddedToFriends)
    }
    
    func updateAddToFriendsButton(_ isAdded: Bool){
        if isAdded {
            addToFriendsButton.backgroundColor = UIColor(white: 1, alpha: 0)
            addToFriendsButton.layer.borderColor = UIColor.customBlue.cgColor
            addLabel.textColor = .customBlue
            addIcon.tintColor = .customBlue
            addLabel.text = String(localized: "ADD")
            addIcon.image = UIImage(systemName: "plus.circle.fill")
        } else {
            addToFriendsButton.backgroundColor = UIColor.transparentToDark
            addToFriendsButton.layer.borderColor = UIColor.grayToTransparent.cgColor
            addLabel.textColor = .systemGray
            addIcon.tintColor = .systemGray
            addLabel.text = String(localized: "ADDED")
            addIcon.image = UIImage(systemName: "checkmark.circle.fill")
        }
    }
}

//MARK: - Conformance to SettableCell
extension UserTableViewCell: SettableCell {
    
    typealias TypeOfData = User
    
    static var heightOfCell: Double { 72 }
    
    func configure(with data: User) {
        
        userNickname.text = data.nickName
        userImageView.image = UIImage(named: data.imageName)
        viewModel.isAddedToFriends = data.isYourFriend
        updateAddToFriendsButton(data.isYourFriend)
        userStatusIcon.backgroundColor = .appropriateColor(of: data.status)
        userFriendsLabel.text = friendsLabelCreator(from: data.numberOfFriends)
        
    }
    
    private func friendsLabelCreator(from number: Int) -> String {
        
        if number < 4000 {
            // Example output: "3999 Friends", "234 Friends"
            return smallNumberToFriendsLabel(from: number)
        }
        
        // Example output: "12.4K Friends", "120K Friends"
        return largeNumberToFriendsLabel(from: number)
    }
    
    private func smallNumberToFriendsLabel(from number: Int) -> String {
        return "\(number) "+String(localized: "Friends")
    }
    
    private func largeNumberToFriendsLabel(from number: Int) -> String{
        let numberBeforeDot = number / 1000
        let numberAfterDot = (number % 1000)/100
        if numberAfterDot != 0 {
            return "\(numberBeforeDot).\(numberAfterDot)K "+String(localized: "Friends")
        } else {
            return "\(numberBeforeDot)K "+String(localized: "Friends")
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
        if !viewModel.isAddedToFriends {
            addToFriendsButton.layer.borderColor = UIColor.grayToTransparent.cgColor
        }
        userStatusIcon.layer.borderColor = UIColor.whiteToBlack.cgColor
    }
    
}
