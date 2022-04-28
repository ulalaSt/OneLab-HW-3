
import Foundation
import UIKit

protocol CellConfigurator {
    static var reuseID: String { get }
    static var cellClass: AnyClass { get }
    static var heightOfCell: Double { get }
    func configure(cell: UIView)
}
