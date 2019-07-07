
import UIKit

protocol Reusable: AnyObject {
    func setup(_ viewModel: OrderViewModel)
}

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableView {

    func register<T: UITableViewCell>(_: T) {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

}
