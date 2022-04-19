//
//  FriendsCollectionViewCell.swift
//  OneLab-HW3
//
//  Created by user on 17.04.2022.
//

import UIKit
import SnapKit

//MARK: - Each item cell has image, name, position(job), status icon. Just adding them.

class MyFriendsCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "MyFriendsCollectionViewCell"
    
    private let userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        return userImageView
    }()
    private let userNameLabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.font = .mainCustomFont(.regular, size: 21)
        return userNameLabel
    }()
    private let userPositionLabel: UILabel = {
        let userPositionLabel = UILabel()
        userPositionLabel.numberOfLines = 0
        userPositionLabel.textAlignment = .center
        userPositionLabel.font = .mainCustomFont(.regular, size: 16)
        userPositionLabel.textColor = .systemGray
        return userPositionLabel
    }()
    private let userStatusIcon: UIView = {
        let userStatusIcon = UIView()
        userStatusIcon.clipsToBounds = true
        return userStatusIcon
    }()
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.whiteToBlack
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalTo(userImageView.snp.height)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        stackView.addArrangedSubview(userStatusIcon)
        userStatusIcon.snp.makeConstraints { make in
            make.size.equalTo(10)
        }
        
        stackView.addArrangedSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.bottom).offset(15)
        }
        
        contentView.addSubview(userPositionLabel)
        userPositionLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        DispatchQueue.main.async {
            self.userImageView.layer.cornerRadius = self.userImageView.frame.height/2
            self.userStatusIcon.layer.cornerRadius = self.userStatusIcon.frame.height/2
        }
    }
    public func configure(user: User) {
        userNameLabel.text = user.name
        userPositionLabel.text = user.position
        userImageView.image = UIImage(named: user.imageName)
        userStatusIcon.backgroundColor = .appropriateColor(of: user.status)
    }
}
