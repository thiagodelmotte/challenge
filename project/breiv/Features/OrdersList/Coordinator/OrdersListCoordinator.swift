
import Foundation
import UIKit

class OrdersListCoordinator {
    
    func start() -> UIViewController {
        let ordersListVC = OrdersListViewController()
        let navigation = UINavigationController(rootViewController: ordersListVC)
        navigation.blue()
        return navigation
    }
    
}
