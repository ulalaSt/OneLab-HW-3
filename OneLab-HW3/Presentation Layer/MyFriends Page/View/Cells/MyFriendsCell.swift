//
//  FriendsCollectionViewCell.swift
//  OneLab-HW3
//
//  Created by user on 17.04.2022.
//

import UIKit
import SnapKit

//MARK: - Each collectionView cell has image, name, position(job), status icon. Just adding them.

class MyFriendsCell: UICollectionViewCell {
    
    static var identifier = "MyFriendsCell"
    
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
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout(){
        contentView.addSubview(userImageView)
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalToSuperview().dividedBy(2)
            $0.width.equalTo(userImageView.snp.height)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        stackView.addArrangedSubview(userStatusIcon)
        userStatusIcon.snp.makeConstraints {
            $0.size.equalTo(10)
        }
        
        stackView.addArrangedSubview(userNameLabel)
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(15)
        }
        
        contentView.addSubview(userPositionLabel)
        userPositionLabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.lessThanOrEqualToSuperview()
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
