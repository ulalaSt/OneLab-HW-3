//
//  AddNewFriendViewController.swift
//  OneLab-HW3
//
//  Created by user on 17.04.2022.
//

import UIKit

class AddNewFriendViewController: UIViewController {
    
    private let viewModel = AddNewFriendsViewModel()

    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = String(localized: "Add New Friend")
        view.backgroundColor = UIColor(named: "MyFriendsCellColor")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        tableView.frame = view.frame
    }
}

extension AddNewFriendViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.sections[indexPath.section].items[indexPath.row]
        
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseID)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseID)!
        
        item.configure(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.sections[indexPath.section].items[indexPath.row]
        return type(of: item).height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        
        headerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
        
        guard let headerName = viewModel.sections[section].name else {
            print("No header name issue")
            return nil
        }
        
        let firstAttributes = [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Bold", size: 22)!, NSAttributedString.Key.foregroundColor: UIColor(named: "AddNewFriendHeaderText")!]
        let secondAttributes = [NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Regular", size: 13)!, NSAttributedString.Key.foregroundColor: UIColor(named: "AddNewFriendHeaderNumber")!]
        
        let headerNameAttributed = NSMutableAttributedString(string: headerName, attributes: firstAttributes)
        
        if viewModel.sections[section].showNumberOfRows, !viewModel.sections[section].items.isEmpty {
            let number = viewModel.sections[section].items.count
            let numberAttributed = NSAttributedString(string: "  (\(number))", attributes: secondAttributes)
            headerNameAttributed.append(numberAttributed)
        }
        
        label.attributedText = headerNameAttributed
        
        return headerView
        
    }
}
