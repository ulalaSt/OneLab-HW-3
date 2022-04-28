
import UIKit
import SnapKit

// MARK: - Just configuring table

class AddNewFriendViewController: UIViewController {
    
    private let viewModel = AddNewFriendsViewModel()
    
    private lazy var tableDirector: TableDirector = {
        let tableDirector = TableDirector(tableView: tableView, items: viewModel.sections)
        return tableDirector
    }()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = String(localized: "Add New Friend")
        view.backgroundColor = .whiteToBlack
        layout()
        cellActionHandlers()
        tableDirector.tableView.reloadData()
    }
    
    private func layout(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func cellActionHandlers() {
        self.tableDirector.actionProxy
            .on(action: .custom(UserTableViewCell.didTapButtonAction)) { (config: UserCellConfigurator) in
                    config.item.isYourFriend = !config.item.isYourFriend
                    self.tableDirector.tableView.reloadData()
            }
    }

}
