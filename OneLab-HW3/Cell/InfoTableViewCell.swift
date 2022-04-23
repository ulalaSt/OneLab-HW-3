//
//  AddNewFriendTableViewCell.swift
//  OneLab-HW3
//
//  Created by user on 18.04.2022.
//

import UIKit
import SnapKit

//MARK: - Each option cell has text and corresponding icon. Just setting them.

class OptionTableViewCell: UITableViewCell {
    
    private var optionTextLabel: UILabel = {
        let optionTextLabel = UILabel()
        optionTextLabel.textColor = .customBlue
        optionTextLabel.font = .mainCustomFont(.semibold, size: 17)
        return optionTextLabel
    }()
    
    private var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.tintColor = .systemGray
        iconView.contentMode = .scaleAspectFit
        return iconView
    }()
    
    override func layoutSubviews() {
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(30)
        }
        contentView.addSubview(optionTextLabel)
        optionTextLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
    }
}

//MARK: - Conformance to SettableCell
extension OptionTableViewCell: SettableCell {
    
    typealias TypeOfData = Option

    static var heightOfCell: Double { 44 }
    
    func configure(with data: Option) {
        optionTextLabel.text = data.text
        iconView.image = UIImage(systemName: data.iconName)
    }
}
