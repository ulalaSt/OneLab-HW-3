//
//  FriendsCollectionViewCell.swift
//  OneLab-HW3
//
//  Created by user on 17.04.2022.
//

import UIKit
import SnapKit

class MyFriendsCollectionViewCell: UICollectionViewCell {
    
    static var identifier = "MyFriendsCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let name: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 21)
        return label
    }()
    private let position: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "SFProDisplay-Regular", size: 16)
        label.textColor = .systemGray
        return label
    }()
    private let statusView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
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
        contentView.backgroundColor = UIColor(named: "MyFriendsCellColor")
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
            make.width.equalTo(imageView.snp.height)
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        stackView.addArrangedSubview(statusView)
        statusView.snp.makeConstraints { make in
            make.size.equalTo(10)
        }
        
        stackView.addArrangedSubview(name)
        name.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
        }
        
        contentView.addSubview(position)
        position.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        DispatchQueue.main.async {
            self.imageView.layer.cornerRadius = self.imageView.frame.height/2
            self.statusView.layer.cornerRadius = self.statusView.frame.height/2
        }
    }
    public func configure(user: User) {
        
        self.name.text = user.name
        self.position.text = user.position
        self.imageView.image = UIImage(named: user.imageName)
        
        switch user.status {
        case .online:
            self.statusView.backgroundColor = UIColor(red: 0.204, green: 0.78, blue: 0.349, alpha: 1)
        case .recent:
            self.statusView.backgroundColor = UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
        case .offline:
            self.statusView.backgroundColor = UIColor(named: "MyFriendsBackground")
        }
    }
}
