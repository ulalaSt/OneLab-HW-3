
import Foundation
import UIKit

class TableViewCellConfigurator<CellType: SettableCell, DataType>: CellConfigurator where CellType.TypeOfData == DataType, CellType: UITableViewCell {
    
    static var reuseID: String {
        return String(describing: CellType.self)
    }
    
    static var cellClass: AnyClass {
        return CellType.self
    }
    
    static var heightOfCell: Double {
        return CellType.heightOfCell
    }
    
    var item: DataType
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).configure(with: item)
    }
}
