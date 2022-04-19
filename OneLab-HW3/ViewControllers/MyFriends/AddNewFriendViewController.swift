
import UIKit
import SnapKit

// MARK: - Just configuring table

class AddNewFriendViewController: UIViewController {
    
    private let viewModel = AddNewFriendsViewModel()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = String(localized: "Add New Friend")
        view.backgroundColor = .whiteToBlack
        tableView.delegate = self
        tableView.dataSource = self
        
        layout()
    }
    
    private func layout(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}



//MARK: - Number of sections and rows. Height for rows. And Cell Configuration.

extension AddNewFriendViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = viewModel.sections[indexPath.section].items[indexPath.row]
        return type(of: item).heightOfCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.sections[indexPath.section].items[indexPath.row]
        
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseID)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseID)!
        item.configure(cell: cell)

        return cell
    }
}



//MARK: - Header and Footer heights, and Header View with attributed title

extension AddNewFriendViewController: UITableViewDelegate {
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
        let sectionData = viewModel.sections[section]
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
