//
//  TableDirector.swift
//  One-Lab-3
//
//  Created by Farukh on 23.04.2022.
//

import UIKit

class TableDirector: NSObject {
    
    let tableView: UITableView
    var items = [TableSection]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    let actionProxy = CellActionProxy()
    
    init(tableView: UITableView, items: [TableSection]) {
        self.tableView = tableView
        super.init()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.items = items
        
        NotificationCenter.default.addObserver(self, selector: #selector(onActionEvent(notification:)), name: CellAction.notificationName, object: nil)
    }
    
    @objc fileprivate func onActionEvent(notification: Notification) {
        if let eventData = notification.userInfo?["data"] as? CellActionEventData, let cell = eventData.cell as? UITableViewCell, let indexPath = self.tableView.indexPath(for: cell) {
            actionProxy.invoke(action: eventData.action, cell: cell, configurator: self.items[indexPath.section].items[indexPath.row])
        }
    }
}

//MARK: - Header and Footer heights, and Header View with attributed title
extension TableDirector: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.attributedText = headerAttributedName(for: section)
        
        headerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
        
        return headerView
    }
    
    private func headerAttributedName(for section: Int) -> NSAttributedString {
        let sectionData = items[section]
        let headerName = sectionData.sectionName
        let attributedHeaderName = headerWithAtributes(for: headerName)
        
        if sectionData.showNumberOfRows {
            let number = sectionData.items.count
            attributedHeaderName.append(headerNumberWithAttributes(for: number))
        }
        return attributedHeaderName
    }
    
    private func headerWithAtributes(for headerName: String) -> NSMutableAttributedString {
        let headerAttributes = [
            NSAttributedString.Key.font: UIFont.mainCustomFont(.bold, size: 22),
            NSAttributedString.Key.foregroundColor: UIColor.blackToGray
        ]
        return NSMutableAttributedString(string: headerName, attributes: headerAttributes)
    }
    
    private func headerNumberWithAttributes(for rowCount: Int) -> NSMutableAttributedString {
        let headerNumberAttributes = [
            NSAttributedString.Key.font: UIFont.mainCustomFont(.regular, size: 13),
            NSAttributedString.Key.foregroundColor: UIColor.lightToDarkGray
        ]
        return NSMutableAttributedString(string: "  (\(rowCount))", attributes: headerNumberAttributes)
    }
}

//MARK: - Number of sections and rows. Height for rows. And Cell Configuration.
extension TableDirector: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = items[indexPath.section].items[indexPath.row]
        return type(of: item).heightOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section].items[indexPath.row]
        
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseID)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseID)!
        item.configure(cell: cell)

        return cell
    }
}
