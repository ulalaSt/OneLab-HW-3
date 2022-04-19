//
//  AddNewFriendTableViewCell.swift
//  OneLab-HW3
//
//  Created by user on 18.04.2022.
//

import UIKit
import SnapKit

class InfoTableViewCell: UITableViewCell, SettableCell {
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        label.font = UIFont(name: "SFProDisplay-Semibold", size: 17)
        return label
    }()
    private var iconView: UIImageView = {
        let imageV = UIImageView()
        imageV.tintColor = .systemGray
        imageV.contentMode = .scaleAspectFit
        return imageV
    }()
    
    override func layoutSubviews() {
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(30)
        }
        contentView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
    }
    
    //Conform to be Settable
    typealias TypeOfData = Info

    static var height: Double {
        return 44
    }
    
    func configure(with data: Info) {
        infoLabel.text = data.info
        iconView.image = UIImage(systemName: data.imageName)
    }
}
