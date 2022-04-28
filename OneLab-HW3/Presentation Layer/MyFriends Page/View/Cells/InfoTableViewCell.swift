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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear.withAlphaComponent(0)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(30)
        }
        contentView.addSubview(optionTextLabel)
        optionTextLabel.snp.makeConstraints {
            $0.leading.equalTo(iconView.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
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
